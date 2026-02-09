$port = 3000
$root = $PSScriptRoot
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Server running at http://localhost:$port"
Write-Host "Press Ctrl+C to stop"
while ($listener.IsListening) {
    $context = $listener.GetContext()
    $url = $context.Request.Url.LocalPath
    if ($url -eq "/") { $url = "/index.html" }
    $filePath = Join-Path $root $url.Replace("/", "\")
    if (Test-Path $filePath -PathType Leaf) {
        $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
        $mimeTypes = @{
            ".html"="text/html"
            ".css"="text/css"
            ".js"="application/javascript"
            ".jpg"="image/jpeg"
            ".jpeg"="image/jpeg"
            ".png"="image/png"
            ".svg"="image/svg+xml"
            ".ico"="image/x-icon"
        }
        $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
        $content = [System.IO.File]::ReadAllBytes($filePath)
        $context.Response.ContentType = $mime
        $context.Response.ContentLength64 = $content.Length
        $context.Response.OutputStream.Write($content, 0, $content.Length)
    } else {
        $context.Response.StatusCode = 404
        $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
        $context.Response.OutputStream.Write($msg, 0, $msg.Length)
    }
    $context.Response.Close()
}
