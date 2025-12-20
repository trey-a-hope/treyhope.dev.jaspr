'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "66c45d6f4e7f9bf0a14a55ed7e60a48b",
"version.json": "2bfce32b3d36f3f9bae567389d2d1ac6",
"favicon.ico": "efec2cd56fe3a9bd55ef3925f247797c",
"index.html": "24ef52c885d8b888dc1603b6b2e7ffd8",
"/": "24ef52c885d8b888dc1603b6b2e7ffd8",
"images/logo.svg": "7e0c9a5e4fb10e2226ae7e1283e57d1c",
"main.dart.js": "3c61c8de04a42286a35bc85490995192",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "76cf060f06afd4460682c7a752bef324",
"assets/NOTICES": "e6e1afd19e54c738c9eb7d3dad0af601",
"assets/FontManifest.json": "b740a59a6b9ace361f84e9c31f28fce9",
"assets/AssetManifest.bin.json": "504593c8e98974f5dfbb86805e78f6d4",
"assets/packages/walkdown/assets/images/map_world.json": "0b2ddf9c982b1a6aef271b40dc6d5746",
"assets/packages/walkdown/assets/images/house_1.json": "b74f9725bc9c74584d12858e51d83e7e",
"assets/packages/walkdown/assets/images/house_2/map.json": "2eb36fa00a05be855b1cf6f2cce48bfa",
"assets/packages/walkdown/assets/images/house_2/spritesheet.png": "1a38f8d29ea5c8006f7f8b1a6814c5ed",
"assets/packages/walkdown/assets/images/players/boy_faceset.png": "9a57f29b8590c07dace4516e0d9d20f2",
"assets/packages/walkdown/assets/images/players/boy_sprite_sheet.png": "c4899bac9cd9df6b81dc703cdf42a285",
"assets/packages/walkdown/assets/images/players/skeleton_walk_strip8.png": "c8f37a6073f885506cfdbcf1f483f523",
"assets/packages/walkdown/assets/images/players/skeleton_idle_strip6.png": "b9ef6662a5ade263fcdafdc74912eebb",
"assets/packages/walkdown/assets/images/players/villager_sprite_sheet.png": "347336c3b2aee87168e59d4910d7bf85",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_13.png": "192dc09e545ef5363d53b6ac5fa8b2fe",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_9.png": "a927c80ba6ce7d06f7bae18400b51b80",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_8.png": "2ed232ff49b9ff07f0b59e8f324a6461",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_12.png": "b8f00524340b750ea650cd1438830350",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_10.png": "1d0d5c74565a1b100279244082a2e41f",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_11.png": "29b51c2b813d004f2675d0e3bde6e65e",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_15.png": "c812896688fdc733e0153ff1b2264811",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_14.png": "93c67f3a70cd45fbafd33e4bd7fc1597",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_16.png": "7cba2ccd66adbb3057f90ec236104746",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_17.png": "9244dbd8e4cf5467df2ff66f06f1de6f",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_1.png": "e14086946c9ff6bab3c21319de7d7810",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_19.png": "a149b044e08846f0e44487de23dde516",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_3.png": "9fd3f2e49b63ee2ab1023ec600819e25",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_2.png": "d73230794e6443944c22bbc741ce0433",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_18.png": "1acbd4c7fd195f89f92d1852540912c2",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_20.png": "b7a591fcfd50922868a4eb94939558f8",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_6.png": "ede3b9b08c264e98a9611243a7e16b95",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_7.png": "98a5e8cf7e47f74c2c0cd3fba277f4c7",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_5.png": "faf2d4f74ebb1aba520cba69e885817b",
"assets/packages/walkdown/assets/images/decorations/computer/pc_1_4.png": "249d07611846806b58e6665c72d20d01",
"assets/packages/walkdown/assets/images/map_world/map.json": "951a79eb7408296e458638edccd8d5d4",
"assets/packages/walkdown/assets/images/map_world/spritesheet.png": "bc3b2b4d2b9d4be89df1c4e0461f7354",
"assets/packages/walkdown/assets/images/house_1/map.json": "abf26137774521b07697e1ea8f2b611d",
"assets/packages/walkdown/assets/images/house_1/spritesheet.png": "39678590105741d86fd5b83b0196ec71",
"assets/packages/walkdown/assets/images/house_2.json": "d8ad60538865382ccea786b913dd3f8a",
"assets/packages/walkdown/assets/audio/background_music.mp3": "10767fb86287022b402322a4d8367ab4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/lucide_icons_flutter/assets/lucide.ttf": "c258d3dac804131f210d74497400b677",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w500.ttf": "16af72c48fb317c0394443a596894470",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w100.ttf": "03a41ff71a9b9c997d1a895f8f9e4e6c",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w300.ttf": "16a7b5400b7f48aba16c6ad6df7d9d45",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w400.ttf": "0980d0622617f6ea65dcc772a24f5b47",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w600.ttf": "e0073a565248366ae0515dcf40431aa4",
"assets/packages/lucide_icons_flutter/assets/build_font/LucideVariable-w200.ttf": "068470b5a67b5028188b49cfc54cb2bd",
"assets/packages/shadcn_ui/fonts/GeistMono-SemiBold.otf": "02036797116901c5db4a3a629561e588",
"assets/packages/shadcn_ui/fonts/Geist-UltraLight.otf": "b64b37fbec0a925067cbf530e4962fec",
"assets/packages/shadcn_ui/fonts/GeistMono-Light.otf": "92c6dfb1c2854b6b0fd3f63ab5af9b7a",
"assets/packages/shadcn_ui/fonts/Geist-Thin.otf": "8603d0fe0def4273ebeee670eedcfb86",
"assets/packages/shadcn_ui/fonts/Geist-Bold.otf": "d3e1d3dc690224fd330969af598a9c31",
"assets/packages/shadcn_ui/fonts/Geist-Black.otf": "cf003c4f85b590cf60bec1e111ebaaf5",
"assets/packages/shadcn_ui/fonts/Geist-Regular.otf": "4d02716b4f2f2e4d9c568c8d24e8e74d",
"assets/packages/shadcn_ui/fonts/GeistMono-UltraLight.otf": "45ea4a4ba1034f7fa081c8b7ee958734",
"assets/packages/shadcn_ui/fonts/GeistMono-Thin.otf": "cbf62a8e76578e03404b0314787d9477",
"assets/packages/shadcn_ui/fonts/GeistMono-UltraBlack.otf": "cfad4eb45ce5dff853a6c84c8a7d441b",
"assets/packages/shadcn_ui/fonts/Geist-Light.otf": "21f434e8c2b53240a0c459b9d119f22f",
"assets/packages/shadcn_ui/fonts/GeistMono-Regular.otf": "42af0dfdb5e9e272e7ac28868b5b99fb",
"assets/packages/shadcn_ui/fonts/GeistMono-Bold.otf": "fce632a1c87f36e92fb23ae5618176ce",
"assets/packages/shadcn_ui/fonts/Geist-SemiBold.otf": "2c0b1d3e7b1c71bedc2eecf78f7a1d1d",
"assets/packages/shadcn_ui/fonts/Geist-Medium.otf": "f7ceaf00b58d396cf93ff1ea43740027",
"assets/packages/shadcn_ui/fonts/GeistMono-Medium.otf": "b1f17a06e50fba3f1e9695c2a8ae0783",
"assets/packages/shadcn_ui/fonts/GeistMono-Black.otf": "d72857791f93bbf88629ab9601ebfa14",
"assets/packages/shadcn_ui/fonts/Geist-UltraBlack.otf": "f3591a030925294b2bb427e6a6c9b0d8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "e9ed4407c3eb96b00d8588e9ef69c625",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
