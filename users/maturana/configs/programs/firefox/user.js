/* STARTUP */

// disable session restore
user_pref('browser.startup.page', 0);

// set home and new page window
user_pref('browser.startup.homepage', 'https://start.duckduckgo.com/');
user_pref('browser.newtabpage.enabled', false);
user_pref('browser.newtab.preload', false);

// disable some activity stream
user_pref('browser.newtabpage.activity-stream.feeds.telemetry', false);
user_pref('browser.newtabpage.activity-stream.telemetry', false);
user_pref('browser.newtabpage.activity-stream.feeds.snippets', false);
user_pref('browser.newtabpage.activity-stream.feeds.discoverystreamfeed', true);

// disable sponsored sites
user_pref('browser.newtabpage.activity-stream.showSponsored', false);
user_pref('browser.newtabpage.activity-stream.showSponsoredTopSites', false);

// clear default top sites
user_pref('browser.newtabpage.activity-stream.default.sites', '');


/* BOOKMARKS */

// show bookmarks toolbar in all tabs
user_pref('browser.toolbars.bookmarks.visibility', 'always');


/* GEOLOCATION */

// use Mozilla geolocation service
user_pref('geo.provider.network.url', 'https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%');

// disable OS's geolocation service
user_pref('geo.provider.use_gpsd', false);

// disable region updates
user_pref('geo.provider.update.enabled', false);

// set prefered languages for websites
user_pref('intl.accept_languages', 'en-US, en');


/* EXTENSIONS */

// remove pocket
user_pref('extensions.pocket.enabled', false);

// disable recomendation pane in about:addons (uses Google Analytics)
user_pref('extensions.getAddons.showPane', false);


/* AUTO INSTALL */

// disable search engine updates
user_pref('browser.search.update', false);


/* TELEMETRY */

// disable new data submission
user_pref('datareporting.policy.dataSubmissionEnabled', false);

// disable health reports
user_pref('datareporting.healthreport.uploadEnabled', false);

// disable telemetry
user_pref('toolkit.telemetry.unified', false);
user_pref('toolkit.telemetry.enabled', false);
user_pref('toolkit.telemetry.server', 'data:,');
user_pref('toolkit.telemetry.archive.enabled', false);
user_pref('toolkit.telemetry.newProfilePing.enabled', false);
user_pref('toolkit.telemetry.shutdownPingSender.enabled', false);
user_pref('toolkit.telemetry.updatePing.enabled', false);
user_pref('toolkit.telemetry.bhrPing.enabled', false);
user_pref('toolkit.telemetry.firstShutdownPing.enabled', false);

// disable telemetry coverage
user_pref('toolkit.coverage.opt-out', true);
user_pref('toolkit.coverage.endpoint.base', '');


/* SEARCH */

// disable location bar domain guessing
user_pref('browser.fixup.alternate.enabled', false);

// display all parts of the url in the location bar
user_pref('browser.urlbar.trimURL', false);

// disable search suggestions
user_pref('browser.search.suggest.enabled', false);
user_pref('browser.urlbar.suggest.searches', false);
user_pref('browser.urlbar.suggest.quicksuggest', false);
// user_pref('browser.urlbar.suggest.history', false);
user_pref('browser.urlbar.suggest.topsites', false);

// disable location bar making speculate connections
user_pref('browser.urlbar.speculativeConnect.enabled', false);

// disable search and form history
user_pref('browser.formfill.enable', false);

// disable form autofill
user_pref('extensions.formautofill.addresses.enabled', false);
user_pref('extensions.formautofill.available', 'off');
user_pref('extensions.formautofill.creditCards.available', false);
user_pref('extensions.formautofill.creditCards.enabled', false);
user_pref('extensions.formautofill.heuristics.enabled', false);


/* PASSWORDS */

// set when firefox should prompt for the primary password
user_pref('security.ask_for_password', 2);

// disable auto-filling
user_pref('signon.autofillForms', false);

// disable login capture
user_pref('signon.formlessCapture.enabled', false);


/* PERSISTENT STORAGE */

// block third-party cookies
user_pref('network.cookie.cookieBehavior', 1);
user_pref('network.cookie.lifetimePolicy', 0);
user_pref('browser.contentblocking.category', 'custom');

// enable Enhanced Tracking Protection (ETP) in all windows
user_pref('privacy.trackingprotection.enabled', true);
