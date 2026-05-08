// ==UserScript==
// @name     SponsorBlock Lite
// @version  2.0
// @match    *://*.youtube.com/watch*
// @grant    none
// @run-at   document-end
// ==/UserScript==

(function() {
    'use strict';

    const API = 'https://sponsor.ajay.app/api/skipSegments';
    const CATEGORIES = ['sponsor', 'selfpromo', 'interaction', 'intro', 'outro'];

    let activeSegments = [];
    let lastVideoId = null;

    function getVideoId() {
        return new URLSearchParams(location.search).get('v');
    }

    function fetchSegments(videoId) {
        const url = `${API}?videoID=${videoId}&categories=${encodeURIComponent(JSON.stringify(CATEGORIES))}`;
        fetch(url)
            .then(r => {
                if (r.ok) return r.json();
                throw new Error(r.status);
            })
            .then(segments => {
                activeSegments = segments;
                console.log(`[SponsorBlock] Loaded ${segments.length} segments for ${videoId}`);
            })
            .catch(e => {
                activeSegments = [];
                if (e.message !== '404') {
                    console.log(`[SponsorBlock] Error: ${e.message}`);
                }
            });
    }

    function skipCheck() {
        const video = document.querySelector('video');
        if (!video || activeSegments.length === 0) return;

        for (const seg of activeSegments) {
            const [start, end] = seg.segment;
            if (video.currentTime >= start && video.currentTime < start + 1) {
                video.currentTime = end;
                console.log(`[SponsorBlock] Skipped ${seg.category}: ${start.toFixed(1)}s → ${end.toFixed(1)}s`);
                break;
            }
        }
    }

    function init() {
        const videoId = getVideoId();
        if (videoId && videoId !== lastVideoId) {
            lastVideoId = videoId;
            fetchSegments(videoId);
        }
    }

    // Poll for skipping (more reliable than timeupdate event)
    setInterval(skipCheck, 1000);

    // Watch for SPA navigation
    const observer = new MutationObserver(init);
    observer.observe(document.querySelector('title') || document.head, { childList: true, subtree: true });

    init();
})();
