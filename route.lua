routes = {}
routes['^/(.*).(jpg|gif|png|css|js|ico|swf|flv|mp3|mp4|woff|eot|ttf|otf|svg)'] = function()
    header('Cache-Control: max-age=864000')
    sendfile(headers.uri)
end

routes['^/server-traffic/'] = function()
    dofile('/server-traffic/index.lua')
end

if not router(headers.uri, routes, '/') then
    header('HTTP/1.1 404 Not Found')
    echo('File Not Found!')
end