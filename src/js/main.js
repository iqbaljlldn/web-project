// Main JavaScript for CLI Demo Site
console.log('CLI Demo Site loaded at:', new Date());

// Function to log user interactions
function logActivity(action, details) {
    const timestamp = new Date().toISOString();
    console.log(`[${timestamp}] ${action}: ${details}`);
}

// Track page visits
document.addEventListener('DOMContentLoaded', function() {
    logActivity('PAGE_LOAD', window.location.pathname);
});

// Track clicks
document.addEventListener('click', function(e) {
    if (e.target.tagName === 'A') {
        logActivity('LINK_CLICK', e.target.href);
    }
});
