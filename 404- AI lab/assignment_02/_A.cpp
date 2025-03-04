#include <bits/stdc++.h>
#define fi first
#define si second
using namespace std;
const int N = 100;
const int INF = 10000;

int n, m;
int Grid[N][N];
double cost[N][N], dist[N][N];
pair<int, int> parent[N][N];
double Euclidean_Distance[N][N];
int Manhattan_Distance[N][N];
int Diagonal_Distance[N][N];

int x_direction[] = {0, -1, 0, +1, -1, -1, +1, +1};
int y_direction[] = {+1, 0, -1, 0, +1, -1, -1, +1};

void Euclidean(pair<int, int> goal);
void Manhattan(pair<int, int> goal);
void Diagonals(pair<int, int> goal);

int main()
{
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
    cin >> n >> m;
    int obstacle;
    cin >> obstacle;
    while (obstacle--)
    {
        int u, v;
        cin >> u >> v;
        Grid[u][v] = 1;
    }
    pair<int, int> start, goal;
    cin >> start.fi >> start.si;
    cin >> goal.fi >> goal.si;
    Euclidean(goal);
    Manhattan(goal);
    Diagonals(goal);

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            cost[i][j] = INF;
            dist[i][j] = INF;
        }
    }
    for (int i = 0; i < 3; i++)
    {
        auto start_time = clock();
        if (i == 0)
            cout << "According to Euclidean_Distance :  \n\n";
        else if (i == 1)
            cout << "\nAccording to  Manhattan_Distance :  \n\n";
        else
            cout << "\nAccording to Diagonal_Distance :  \n";

        priority_queue< pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> q;
        q.push(start);
        cost[start.fi][start.si] = 0;
        while (!q.empty())
        {
            auto u = q.top().fi;
            auto v = q.top().si;
            if (q.top() == goal)
            {
                break;
            }
            int Dis;
            if (i == 0)
                Dis = Euclidean_Distance[u][v];
            else if (i == 1)
                Dis = Manhattan_Distance[u][v];
            else
                Dis = Diagonal_Distance[u][v];

            q.pop();
            for (int k = 0; k < 8; k++)
            {
                int adj_u = u + x_direction[k];
                int adj_v = v + y_direction[k];
                if ( adj_u>= 0 and adj_u < n and adj_v >= 0 and adj_v < m and Grid[adj_u][adj_v] != 1
                        and cost[u][v] + Dis + 1 < cost[adj_u][adj_v])
                {
                    dist[adj_u][adj_v] = dist[u][v] + 1;
                    cost[adj_u][adj_v] = cost[u][v] + Dis + 1;
                    parent[adj_u][adj_v] = make_pair(u, v);
                    q.push(make_pair(adj_u, adj_v));
                }
            }
        }
        int ans = dist[goal.fi][goal.si];
        if (ans == INF)
        {
            cout << "NO REACH GOAL NODE\n";
            return 0;
        }
        vector<pair<int, int>> path_list;
        auto cur = goal;
        while (cur != start)
        {
            path_list.push_back(cur);
            cur = parent[cur.fi][cur.si];
        }

        path_list.push_back(start);

        cout << "Path: [";
        reverse(path_list.begin(), path_list.end());
        for (int i = 0; i < path_list.size(); i++)
        {
            if (i < path_list.size() - 1)
                cout << "(" << path_list[i].fi << ", " << path_list[i].si << "), ";
            else
                cout << "(" << path_list[i].fi << ", " << path_list[i].si << ")]";
        }
        cout << endl
             << "Total Path Cost: " << path_list.size() << endl;
        cout << "Time Taken (milliseconds): ";
        cout << (float)(clock() - start_time) / CLOCKS_PER_SEC << endl;
        // clear
        path_list.clear();
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < m; j++)
            {
                cost[i][j] = INF;
                dist[i][j] = INF;
            }
        }


    }
    return 0;


}

void Euclidean(pair<int, int> goal)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            Euclidean_Distance[i][j] = sqrt((goal.fi - i) * (goal.fi - i) + (goal.si - j) * (goal.si - j));
        }
    }
}
void Manhattan(pair<int, int> goal)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            Manhattan_Distance[i][j] = abs(goal.fi - i) + abs(goal.si - j);
        }
    }
}
void Diagonals(pair<int, int> goal)
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            Diagonal_Distance[i][j] = max(abs(goal.fi - i), abs(goal.si - j));
        }
    }
}
