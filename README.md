# A service to catch all requests to a specific URL

This service catch all the reqests directed towards a specific service and redirect them towards the real target URL (that is
embedded in the original URI parameter.

## How it works

It uses a standard nginx web server (alpine flavor) with the [ngx_http_js_module](https://github.com/peter-leonov/ngx_http_js_module).
A snippet of js code decode the target url and redirect the http client towards the target site.

```javascript
function root(r) {
    var url = decodeURIComponent(r.args.u);
    r.log("Decoding url: " + r.args.u);
    r.log("Redirecting to: " + url);
    r.return(301, url);
}

export default {root};
```

## How to build

The Dockerfile copy inside a specific nginx configuration that listen on port 8000 and include the http.js code file.

## How to use

The container can be used ina k8s cluster by defining properly service and ingress manifests.

