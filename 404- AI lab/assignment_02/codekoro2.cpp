#include<bits/stdc++.h>
#define ll long long
using namespace std;

const int N = 100 ;
const ll INF = 1e9;
#define GREEN 0
#define RED 1
int n , m;
int s[N][N];
double cost[N][N] , dist[N][N];
pair<int, int> par[N][N];
double Euclidean_Distance[N][N];
int Manhattan_Distance[N][N];
int Diagonal_Distance[N][N];

int dx[] = {0, -1, 0, +1, -1, -1, +1, +1};
int dy[] = {+1, 0, -1, 0, +1, -1, -1, +1};

void Manhattan_Distances (pair<int , int> goal) {
	// precalculate Manhattan Distance.
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) {
			Manhattan_Distance[i][j] = abs(goal.first - i) + abs(goal.second - j);
		}
	}
}
void Diagonal_Distances (pair<int , int> goal) {
	// precalculate Diagonal_Distance.
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) {
			Diagonal_Distance[i][j] = max(abs(goal.first - i) , abs(goal.second - j));
		}
	}
}
void Euclidean_Distances (pair<int , int> goal) {
	// precalculate Euclidean Distance.
	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) {
			Euclidean_Distance[i][j] = sqrt((goal.first - i) * (goal.first - i) + (goal.second - j) * (goal.second - j));
		}
	}
}
bool is_valid(int i, int j) {
	// verify if the cell on the maze/grid is valid or not.
	return i >= 0 and i < n and j >= 0 and j < m;
}
int main() {
	auto st = clock(); // Time Taken Start From Here
	ios_base::sync_with_stdio(0);
	cin.tie(0);
    freopen("input.txt","r",stdin);
	cin >> n >> m; //For initializing a (m x n) grid

	for(int i = 0; i < n; i++) {
		for(int j = 0; j < m; j++) {
			s[i][j] = GREEN;
		}
	}

	int obstacles; // number of coordinates that have obstacles
	cin >> obstacles;
	while(obstacles--) {
		int u , v;
		cin >> u >> v;
		s[u][v] = RED;
	}
	pair<int, int> start, end;
	cin >> start.first >> start.second; // Coordinates of the start cell
	cin >> end.first >> end.second;     // Coordinates of the goal cell
	Euclidean_Distances(end);
	//Manhattan_Distances(end);
	//Diagonal_Distances(end);

	// APPLYING BFS
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			cost[i][j] = INF;
			dist[i][j] = INF;
		}
	}
	priority_queue<pair<int, int>,vector<pair<int, int>>,greater<pair<int, int>>> q;
	q.push(start);
	cost[start.first][start.second] = 0;
	while (!q.empty()) {
		auto [u, v] = q.top();
		q.pop();
		for (int k = 0; k < 8; k++) {
			int nxt_u = u + dx[k];
			int nxt_v = v + dy[k];
			if (is_valid(nxt_u, nxt_v) and s[nxt_u][nxt_v] != RED and cost[u][v] + Euclidean_Distance[u][v] + 1  < cost[nxt_u][nxt_v]) {
				dist[nxt_u][nxt_v] = dist[u][v] + 1;
				cost[nxt_u][nxt_v] = cost[u][v] + Euclidean_Distance[u][v] + 1;
				par[nxt_u][nxt_v] = make_pair(u, v);
				q.push(make_pair(nxt_u, nxt_v));
			}
		}
	}
	// Printing Path
	int ans = dist[end.first][end.second];
	if (ans == INF) {
		cout << "NO WAY TO REACH DESTINATION\n";
		return 0;
	}
	vector<pair<int, int>> path;
	auto cur = end;
    while (cur != start) {
      path.push_back(cur);
      cur = par[cur.first][cur.second];
    }
    path.push_back(start);
    cout << "Path: [";
  	reverse(path.begin(), path.end());
  	for(int i = 0; i < path.size(); i++) {
  		if(i < path.size() - 1) cout << "(" << path[i].first << ", " << path[i].second << "), ";
  		else cout << "(" << path[i].first << ", " << path[i].second << ")]";
  	}

  	cout << endl << "Path Cost: " << path.size() << endl;
  	cout << "Time Taken (in milliseconds): ";
  	cout << 1.0 * (clock()-st) / CLOCKS_PER_SEC ;
	return 0;
}
