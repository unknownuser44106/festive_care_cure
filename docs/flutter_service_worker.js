'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1815af0fc3c01a3c7ab167a6073d2b14",
"assets/AssetManifest.bin.json": "66a372f440eba711ebbf75b4a29d395a",
"assets/AssetManifest.json": "0ffe9d23350763c717b3e9ecec6bd3d4",
"assets/assets/icons/holy.jpg": "487757ffe631f01b85d8a71781ff41c9",
"assets/assets/icons/prof_icon.jpg": "78879995712d291e6cb0719ce1326240",
"assets/assets/icons/rama.jpg": "d84c346732901dabd1cd35ffcb72d7c7",
"assets/assets/icons/sankranti.jpg": "8d37ec265b1cd319f266a80d7378f2f5",
"assets/assets/icons/shivaratri.jpg": "bc5233a36159e9d23a312c3dbafd1fce",
"assets/assets/icons/ugadi.jpg": "3939ad8e554e0023328ec0e6b39701d8",
"assets/assets/picture/ashwa.jpeg": "ea59029d923970b3bbba021d2189c89d",
"assets/assets/picture/ayurvedic.jpg": "6342b306b4b8398554a9547dc0111eec",
"assets/assets/picture/boss.jpg": "05bbc19c0cf31e8e480864fe9409d08b",
"assets/assets/picture/dai.jpg": "d92db2335d0585c9e5f8a84baeac8f57",
"assets/assets/picture/devali_icon.jpg": "ad21cbc6312bc4d986913ce552302931",
"assets/assets/picture/dg.jpeg": "711b25b08e90122e0a0ecbf81456977b",
"assets/assets/picture/duleaves.webp": "846e45c3b6362bceb57a1a4315d0d18f",
"assets/assets/picture/festPic.jpg": "c083e3bea5adbda9d8abe62c4f38c00c",
"assets/assets/picture/ganesh.webp": "35635d5741e1eacc8e618051367ce219",
"assets/assets/picture/ganeshicon.jpg": "be995e45eb1a90203bca018e7ced1a4f",
"assets/assets/picture/gangajala.jpeg": "f89e4db81b519a9e5dda7d9f6ba2be13",
"assets/assets/picture/google.jpeg": "14fb29685adbf2f96d356c5be2f9a249",
"assets/assets/picture/hanumanchalis.jpeg": "217347d7ff5f70c9d0edefcb5351f4f4",
"assets/assets/picture/holi_one.jpg": "7ffd7fda5bdf63dea06bdbee70d2e48d",
"assets/assets/picture/holi_two.jpg": "bf674bcd5a5c3e5591a37bbe1bf37f1c",
"assets/assets/picture/home_medicine.jpg": "126648932b9707bfb7e8b5e0b8a4e661",
"assets/assets/picture/hsindur.jpeg": "cc29276608c97dd70a4f3e6c1ffb0f66",
"assets/assets/picture/idol.jpeg": "f0f152aa700339f8492362d1fb5e98c0",
"assets/assets/picture/kidol.jpeg": "c5c24ec1d75db3f29fe30be8dd52a6fd",
"assets/assets/picture/kite.jpg": "78c3b1285d5d7ac029c9ac33390fa57a",
"assets/assets/picture/krishnaicon.jpg": "55557f83a9f0993533ec45195a6502d9",
"assets/assets/picture/leaves.jpeg": "dfa2d7aae39689578409735b5248f61b",
"assets/assets/picture/linga.jpeg": "b056a4dfd40bee01021a13642b3589b1",
"assets/assets/picture/login%2520pic.jpeg": "de98f68844efd1aecafd7545f53bb832",
"assets/assets/picture/rudraksha.jpeg": "a46af73ed436b92d6063064d453c75a8",
"assets/assets/picture/sacredash.webp": "1be5ef9eb3e42691318297bbec9b9095",
"assets/assets/picture/sankranti_info.jpg": "0541168ec71d6a93b17ccab76b654c30",
"assets/assets/picture/shiva_four.jpg": "73c0f1a6b2d85469cce5586f4f7ac51b",
"assets/assets/picture/shiva_intro.jpg": "359ebfee9238970875e872afd208e711",
"assets/assets/picture/shiva_one.jpg": "ec91c9016f2fa6479ef03a5397f4d7f0",
"assets/assets/picture/shiva_three.jpg": "5ebebea56a3c8c2fc42473859dc18ff6",
"assets/assets/picture/shiva_two.jpg": "87fbdd75a85b12aa587fd982e9f052ae",
"assets/assets/picture/sugercane.jpg": "30c1f66201eb19f6cc5bad71c64b4619",
"assets/assets/picture/tl.jpeg": "d019adc6dbc752fcdc61f1b3e362c337",
"assets/assets/picture/tpacked.jpeg": "3ad457a970865678d17273fd2c93bbc9",
"assets/assets/picture/tulasi_icon.jpg": "42c8f7840a30b4ee5174807859204115",
"assets/assets/picture/tulasi_one.jpg": "ab0cd435254d8eca86409c5101acbae3",
"assets/assets/picture/ugadi_four.jpg": "b4f36d95cad6d75a40a09650bc71ac26",
"assets/assets/picture/ugadi_icon.jpg": "80beee39a2899c8c92cdc6ab39948322",
"assets/assets/picture/ugadi_one.jpg": "60ecfad1a717919f094de0711f0832ff",
"assets/assets/picture/ugadi_three.jpg": "4d015b859d36e7248a626d99422d71dc",
"assets/assets/picture/ugadi_two.jpg": "492120906799d448359ee4449e5c6e8a",
"assets/assets/picture/white%2520flowers.webp": "b3aa74b9916af10d9c4270ef9544fdfa",
"assets/assets/picture/wlcm.jpg": "46a7c28c28e162edc2571c7c71670e4b",
"assets/FontManifest.json": "45d200b44a7499fb0ae98f208531c5de",
"assets/fonts/MaterialIcons-Regular.otf": "16cc94236424ff181e034e30b3262ae3",
"assets/NOTICES": "b96b2fdb4f82ac1964264a1f2261d834",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "00a0d5a58ed34a52b40eb372392a8b98",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "76bd55cc08e511bb603cc53003b81051",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "bcaf3ba974cf7900b3c158ca593f4971",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "bd8c68650429200ed0e5db64e7323e76",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c3ba2e98394aaff892aa35e35f3b7931",
"/": "c3ba2e98394aaff892aa35e35f3b7931",
"main.dart.js": "4da75ed37f7d2d58bd78df19f6d1b3e9",
"manifest.json": "f124696858eb12a72c5bcbb086ac0a9f",
"version.json": "e900478e90a205032013d9eb6871aac1"};
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
