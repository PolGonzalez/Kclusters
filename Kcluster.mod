#Optimal cluster-median problem formulation

#k clusters
param k;

#m points
param m;

#distance matrix
param d{1..m,1..m};

#x_{i,j} is 1 if point i belongs to cluster j, 0 otherwise
var x{1..m,1..m} binary;

#minimize sum of distances
minimize f: sum{i in 1..m, j in 1..m} d[i,j]*x[i,j];

subject to every_point_in_one_cluster{i in 1..m}: sum{j in 1..m} x[i,j] = 1;

subject to k_clusters: sum{i in 1..m} x[i,i] = k;

subject to point_in_j_if_jcluster_exists{i in 1..m,j in 1..m}: x[i,j] <= x[j,j];