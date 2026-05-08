// ==UserScript==
// @name     Video Speed Controller
// @version  1.0
// @match    *://*/*
// @grant    none
// @run-at   document-end
// ==/UserScript==

(function() {
    'use strict';
    document.addEventListener('keydown', (e) => {
        const video = document.querySelector('video');
        if (!video || e.target.tagName === 'INPUT' || e.target.tagName === 'TEXTAREA' || e.target.isContentEditable) return;
        switch(e.key) {
            case ']': video.playbackRate = Math.min(video.playbackRate + 0.25, 5); break;
            case '[': video.playbackRate = Math.max(video.playbackRate - 0.25, 0.25); break;
            case '\\': video.playbackRate = 1.0; break;
        }
    });
})();
