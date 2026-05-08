// ==UserScript==
// @name     Privacy Redirect
// @version  1.0
// @match    *://www.reddit.com/*
// @match    *://old.reddit.com/*
// @match    *://twitter.com/*
// @match    *://x.com/*
// @match    *://www.instagram.com/*
// @grant    none
// @run-at   document-start
// ==/UserScript==

(function() {
    'use strict';
    const host = location.hostname;
    const path = location.pathname;

    const rules = {
        'www.reddit.com': () => location.href.replace('www.reddit.com', 'old.reddit.com'),
        'twitter.com': () => location.href.replace('twitter.com', 'nitter.net'),
        'x.com': () => location.href.replace('x.com', 'nitter.net'),
        'www.instagram.com': () => {
            const match = path.match(/^\/([^/?]+)/);
            if (match && match[1] !== 'p' && match[1] !== 'reel' && match[1] !== 'explore') {
                return 'https://www.pixnoy.com/profile/' + match[1];
            }
            return null;
        },
    };

    if (rules[host]) {
        const target = rules[host]();
        if (target && target !== location.href) {
            location.replace(target);
        }
    }
})();
