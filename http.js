function root(r) {
    var url = decodeURIComponent(r.args.u);
    r.log("Decoding url: " + r.args.u);
    r.log("Redirecting to: " + url);
    r.return(301, url);
}

export default {root};
