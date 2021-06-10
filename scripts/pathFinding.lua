-- https://rosettacode.org/wiki/Dijkstra%27s_algorithm#Lua


-- Graph definition
local edges = {
--     a = {b = 1, c = 3},
--     b = {d = 1},
--     c = {d = 3},
--     d = {},
}

-- Fill in paths in the opposite direction to the stated edges
function complete (graph)
    for node, edges in pairs(graph) do
        for edge, distance in pairs(edges) do
            if not graph[edge] then graph[edge] = {} end
            graph[edge][node] = distance
        end
    end
end
 
-- Create path string from table of previous nodes
function follow (trail, destination)

    local path, nextStep = destination, trail[destination]

    while nextStep do
        path = nextStep .. " " .. path
        nextStep = trail[nextStep]
    end

    return path
end
 
-- Find the shortest path between the current and destination nodes
function dijkstra(graph, current, destination, directed)

	edges = graph

    if not directed then complete(graph) end
    local unvisited, distanceTo, trail = {}, {}, {}
    local nearest, nextNode, tentative
    for node, edgeDists in pairs(graph) do
        if node == current then
            distanceTo[node] = 0
            trail[current] = false
        else
            distanceTo[node] = math.huge
            unvisited[node] = true
        end
    end

    repeat
        nearest = math.huge
        for neighbour, pathDist in pairs(graph[current]) do
            if unvisited[neighbour] then
                tentative = distanceTo[current] + pathDist
                if tentative < distanceTo[neighbour] then
                    distanceTo[neighbour] = tentative
                    trail[neighbour] = current
                end
                if tentative < nearest then
                    nearest = tentative
                    nextNode = neighbour
                end
            end
        end
        unvisited[current] = false
        current = nextNode
    until unvisited[destination] == false or nearest == math.huge

    return distanceTo[destination], follow(trail, destination)
end

-- Main procedure
-- local cost, str = dijkstra(edges, "a", "d", true)
-- DebugPrint("Directed:" .. str)