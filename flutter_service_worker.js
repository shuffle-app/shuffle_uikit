'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "2d3c160930bd293d2701ae88085e157d",
"/": "2d3c160930bd293d2701ae88085e157d",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "deeb02ff8a81e85b38a6d153ad645b39",
"main.dart.js": "e25d7ec90c6d4030fcf6c58d0de12110",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"manifest.json": "becbe78f0171888e329e6df051215d36",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/fonts/MaterialIcons-Regular.otf": "022f642dfa4154431e8b3a2c4db703c3",
"assets/AssetManifest.bin": "a7e5361e22b6f9e437c068ffa51ff4eb",
"assets/AssetManifest.json": "6e378d818af35c7af2f7bf83955c9ef7",
"assets/NOTICES": "a670bcc7ae1d07c933d686c5d155220c",
"assets/FontManifest.json": "294fdfe73b8743b3bf3ec1c84c310d8c",
"assets/packages/shuffle_uikit/assets/fonts/Unbounded-Regular.ttf": "bb28c00cd09ce2a42d68c78dfbf71b25",
"assets/packages/shuffle_uikit/assets/fonts/Unbounded-Medium.ttf": "55adb74779693d64f110681b2899380a",
"assets/packages/shuffle_uikit/assets/fonts/Unbounded-SemiBold.ttf": "d47b0191eaa9dac534330da216500fe9",
"assets/packages/shuffle_uikit/assets/fonts/Unbounded-Light.ttf": "e78e751e037218f1d7e35f3a706b835a",
"assets/packages/shuffle_uikit/assets/animations/lottie/shuffle-loader-1.json": "d8c84400ad9de7af9ddd5ae3f741e847",
"assets/packages/shuffle_uikit/assets/audio/rachet_click.mp3": "d743ab8348ca9ab1477707265f108c5b",
"assets/packages/shuffle_uikit/assets/images/png/health-permit.png": "ee3f34c49100ef31bc67acbe75cb23c6",
"assets/packages/shuffle_uikit/assets/images/png/christianity.png": "8ae88b1cfc82ef8df39c358d7f2f0617",
"assets/packages/shuffle_uikit/assets/images/png/Smile-mood.png": "c4264d3f751af7b0c6be67285126f14c",
"assets/packages/shuffle_uikit/assets/images/png/Pie-chart.png": "d858e036f4f2bb87b623d8e5cf97b83f",
"assets/packages/shuffle_uikit/assets/images/png/Victory-hands.png": "2fed0ad0e3f7392f3f57b1ef81da3e01",
"assets/packages/shuffle_uikit/assets/images/png/Rocket.png": "0e6c5425694b1068154cf5b900fed51f",
"assets/packages/shuffle_uikit/assets/images/png/Icecream.png": "beb665e60fadf26f0d3a94b2922edab2",
"assets/packages/shuffle_uikit/assets/images/png/Followers.png": "b5b0e0def0d9ec81fdb1bb2432ee94bc",
"assets/packages/shuffle_uikit/assets/images/png/place.png": "435ecde0a9565b310b15a56fc86419a2",
"assets/packages/shuffle_uikit/assets/images/png/atmosphere.png": "2262e65620263e3787c97dff1631370f",
"assets/packages/shuffle_uikit/assets/images/png/surprise-emoji.png": "236d1d4418e738596736bc98161801ce",
"assets/packages/shuffle_uikit/assets/images/png/onboarding_mock_2.png": "23b7f21e482322ec8eeb6b125691b389",
"assets/packages/shuffle_uikit/assets/images/png/Feedback.png": "57d202cfce601cd04984f5130417ba57",
"assets/packages/shuffle_uikit/assets/images/png/profile_avatar.png": "827f8c0cca8abe806362de525120c2c1",
"assets/packages/shuffle_uikit/assets/images/png/Binoculars.png": "c271bf7773d2e3414dd909d1a1df7a9e",
"assets/packages/shuffle_uikit/assets/images/png/Hat.png": "0113cb9a568d1f9bb6db272a77cee396",
"assets/packages/shuffle_uikit/assets/images/png/profile_story_1.png": "b6771b7db36ed5927964c3ac558279f7",
"assets/packages/shuffle_uikit/assets/images/png/Company.png": "1d48c160a854a26cc3acc78faab35b9d",
"assets/packages/shuffle_uikit/assets/images/png/titled_card_background_4.png": "10dee6c026c0d7e42832d573c6a79745",
"assets/packages/shuffle_uikit/assets/images/png/titled_card_background_3.png": "e5b65c3b8ba555a413fe1cdbcd673bbf",
"assets/packages/shuffle_uikit/assets/images/png/Aubergine.png": "22c698e6cbb9e318ab094b9c03bd5c59",
"assets/packages/shuffle_uikit/assets/images/png/onboarding_mock_3.png": "7025fd11c168bd5279b7d298c70a3881",
"assets/packages/shuffle_uikit/assets/images/png/sadness-emoji.png": "5e8b49da2db89e552c56086193d69342",
"assets/packages/shuffle_uikit/assets/images/png/Smiley-crazy-face-emoji.png": "4d3ea02fa20b941bb069cfdb80d75ea1",
"assets/packages/shuffle_uikit/assets/images/png/Discount.png": "cc8f486d471acc7605b94c57dcc1b24f",
"assets/packages/shuffle_uikit/assets/images/png/Map.png": "88e0cbe54d5967ed1fa3f2f10787dc3a",
"assets/packages/shuffle_uikit/assets/images/png/Outstanding.png": "52bcf031696d2dea1333c849b24d3df9",
"assets/packages/shuffle_uikit/assets/images/png/Clapperboard.png": "ac1ca0ae9c3f651bbb820ac57a530021",
"assets/packages/shuffle_uikit/assets/images/png/angry-emoji.png": "3128dca99f3768200854194019e2775e",
"assets/packages/shuffle_uikit/assets/images/png/Fire.png": "e95878738574edd2245d63b6a28c7bf6",
"assets/packages/shuffle_uikit/assets/images/png/mock_user_avatar.png": "c0d2a5956b579e4191d04c75059bbd14",
"assets/packages/shuffle_uikit/assets/images/png/Technologies.png": "87c8f489650138b31494903356df9a5d",
"assets/packages/shuffle_uikit/assets/images/png/profile_post_1.png": "ccbf3bbab9d37c20b72f45ecb40e45e6",
"assets/packages/shuffle_uikit/assets/images/png/Events.png": "0dd1e215175d5e9e0c1b82f8b8425046",
"assets/packages/shuffle_uikit/assets/images/png/atheist.png": "c9784d880dc058df685f9f17850524b7",
"assets/packages/shuffle_uikit/assets/images/png/buddism_flag.png": "a36acaebbb0487ef9fd713633f5a1365",
"assets/packages/shuffle_uikit/assets/images/png/Sun-wind.png": "a47969ea8e2d381a6476382a91760b0b",
"assets/packages/shuffle_uikit/assets/images/png/love-emoji.png": "0724cdbab34f224ec954826b94c8a286",
"assets/packages/shuffle_uikit/assets/images/png/Yoga.png": "ef8cae1cf0968550fef82f320fb360d5",
"assets/packages/shuffle_uikit/assets/images/png/event_avatar.png": "b7ef1464c2a65494b4b59de99523dd8b",
"assets/packages/shuffle_uikit/assets/images/png/joy-emoji.png": "b7c3ee49cb2cdec4bd697e521bef573a",
"assets/packages/shuffle_uikit/assets/images/png/Donations.png": "78941eba5d62746307fe399e693de514",
"assets/packages/shuffle_uikit/assets/images/png/Dart.png": "2619d3410253fe5075f349a28f8c7cf0",
"assets/packages/shuffle_uikit/assets/images/png/Female.png": "8d2e9e5037e2108c154d5cc3589f18bf",
"assets/packages/shuffle_uikit/assets/images/png/no_internet.png": "11a4cc047abd5710359f911a3f3a019c",
"assets/packages/shuffle_uikit/assets/images/png/Index-finger-hands.png": "e28fcd730457782bcce00206a00a1269",
"assets/packages/shuffle_uikit/assets/images/png/calmness-emoji.png": "78e898eb7bfb00220b3cb70b14ab39a9",
"assets/packages/shuffle_uikit/assets/images/png/Cocktail-2.png": "5d7e09d8376c1b29bb38277e6d3c696e",
"assets/packages/shuffle_uikit/assets/images/png/Training-apparatus.png": "4209ec3e8de1cb2539e0016e9ace9d7e",
"assets/packages/shuffle_uikit/assets/images/png/Cocktail.png": "54123084e97946dbfdddc252789761f2",
"assets/packages/shuffle_uikit/assets/images/png/onboarding_mock_1.png": "856fc75c74d2fa32d72de24b267d78b4",
"assets/packages/shuffle_uikit/assets/images/png/Sun-clouds.png": "3525ffea6787e8ac85a2a2dd36563b3d",
"assets/packages/shuffle_uikit/assets/images/png/anxiety-emogi.png": "053de180de8a1b6503c2aceec5698b84",
"assets/packages/shuffle_uikit/assets/images/png/First-aid-kit.png": "dc3a3de63fd3faaaf39593d011910b66",
"assets/packages/shuffle_uikit/assets/images/png/Hi-new-invitees.png": "31bd8f44646547604066ab466aa1dde5",
"assets/packages/shuffle_uikit/assets/images/png/Bell.png": "1d513acbe32a5ec5ca1b192b0d8fba9c",
"assets/packages/shuffle_uikit/assets/images/png/Other-gender.png": "4e9b8bff3208f1497b8c4a3d9ff2500a",
"assets/packages/shuffle_uikit/assets/images/png/geo-permit.png": "38a8a1840238947d33bd58cae6ec3b0a",
"assets/packages/shuffle_uikit/assets/images/png/hindu.png": "c58fa7cf111858d99468d39d106f7036",
"assets/packages/shuffle_uikit/assets/images/png/Laptop-with-chart.png": "2f3570e647c90f55a0ee4c5ec2c61628",
"assets/packages/shuffle_uikit/assets/images/png/Puzzle.png": "d635dbe4456406450f6152fa17cd48d8",
"assets/packages/shuffle_uikit/assets/images/png/Ski.png": "90b8b86d1b35144b63cc36066075d727",
"assets/packages/shuffle_uikit/assets/images/png/Rock-n-roll-hands.png": "b01318fc8042b480a210257b50fc4447",
"assets/packages/shuffle_uikit/assets/images/png/Money.png": "943c935ea82c907fc79c570202022fcf",
"assets/packages/shuffle_uikit/assets/images/png/compact_rating_card_mock.png": "a24e572722dd282517def71d47553d3e",
"assets/packages/shuffle_uikit/assets/images/png/judaism.png": "2f81189055dd3dcac3ccd5f65ae06e83",
"assets/packages/shuffle_uikit/assets/images/png/Mango.png": "4d67e87203d5ea3f451d5376da6f8921",
"assets/packages/shuffle_uikit/assets/images/png/fatigue-emoji.png": "e6fb55f281aa341cf5f02934bac2e7e0",
"assets/packages/shuffle_uikit/assets/images/png/Baggage.png": "812369e105dbca166dbd4a1707585b03",
"assets/packages/shuffle_uikit/assets/images/png/jordan_flag.png": "04e3c090e945125934e04df773deaad0",
"assets/packages/shuffle_uikit/assets/images/png/Ok-hands.png": "08f984dbccb86020d45c0eca87f4ce02",
"assets/packages/shuffle_uikit/assets/images/png/titled_card_background_1.png": "436a65ce4add3fc56ff6af5d878a8076",
"assets/packages/shuffle_uikit/assets/images/png/Coin.png": "64629387b6cd68de3f5d10b74443478a",
"assets/packages/shuffle_uikit/assets/images/png/muslim_flag.png": "39c480e7a9ae987942850054c74e8993",
"assets/packages/shuffle_uikit/assets/images/png/spinner_event.png": "28986e0ca74e1819a26f87827ed6ed62",
"assets/packages/shuffle_uikit/assets/images/png/Lifebuoy.png": "a7bfed567607c3fee4765a29df823784",
"assets/packages/shuffle_uikit/assets/images/png/titled_card_background_2.png": "58a6bcc62134410e52880e695edd054d",
"assets/packages/shuffle_uikit/assets/images/png/Key.png": "b097e01f79d33d697cb03f55993599f6",
"assets/packages/shuffle_uikit/assets/images/png/Networking.png": "65bbaef6b92afc40a97b93e01044b9f3",
"assets/packages/shuffle_uikit/assets/images/png/Porthole.png": "9a239757d3f58ce9075ecf25e2bbc004",
"assets/packages/shuffle_uikit/assets/images/png/mock_ad_banner.png": "60bed0db2fecc5015ccfd409370373d4",
"assets/packages/shuffle_uikit/assets/images/png/Like-hands.png": "78734dd72b345f7fb14047ed1b6ccb04",
"assets/packages/shuffle_uikit/assets/images/png/balloons.png": "7ddb74a4d9ad87f68d1a315042f7d170",
"assets/packages/shuffle_uikit/assets/images/png/notif-permit.png": "097ccb1ffe2b9f79cd1f95f96af2135e",
"assets/packages/shuffle_uikit/assets/images/png/No-photo.png": "bdf0dd56f4409d618e6ddd340f18d9a9",
"assets/packages/shuffle_uikit/assets/images/png/Male.png": "f5b2489fe8220185552f41c1ff9c9efa",
"assets/packages/shuffle_uikit/assets/images/png/mock_swiper_card.png": "67a1d4da6b5cb33dd100edec89fa7cf2",
"assets/packages/shuffle_uikit/assets/images/svg/Hat.svg": "521e342b358c6f850ddfe667cc558131",
"assets/packages/shuffle_uikit/assets/images/svg/analytics-outline.svg": "2e79f9969d6e9452a326530a9a24a471",
"assets/packages/shuffle_uikit/assets/images/svg/Pixelated-sunglasses-emoji.svg": "774bf3a2f6920dfe8028378e697abe04",
"assets/packages/shuffle_uikit/assets/images/svg/clock.svg": "5e7991ecf9469d31e784eb16de64bc8f",
"assets/packages/shuffle_uikit/assets/images/svg/message.svg": "e46d6a3b1686c76fda423b446bc6fd41",
"assets/packages/shuffle_uikit/assets/images/svg/heart-broken-fill.svg": "19f9b9caea932ce917f563db7ca04fcc",
"assets/packages/shuffle_uikit/assets/images/svg/spinner_wheel.svg": "4ff5a1ef0acc39566591ff95a996e806",
"assets/packages/shuffle_uikit/assets/images/svg/loader.svg": "fbca1ff68301b487bf9d8198a6d8fa10",
"assets/packages/shuffle_uikit/assets/images/svg/family.svg": "e8e488c06ddc6639f0b870e9bf90a18b",
"assets/packages/shuffle_uikit/assets/images/svg/play-fill.svg": "f0531a58f573a136f097b5f485b547f5",
"assets/packages/shuffle_uikit/assets/images/svg/Technologies.svg": "d212634cd4a8b20ff69c2ae06910643a",
"assets/packages/shuffle_uikit/assets/images/svg/Pie-chart.svg": "8846169e162cbb0f615387f9a9723dbf",
"assets/packages/shuffle_uikit/assets/images/svg/Discount.svg": "c02394dd1fa6dbaf95b79f0d7e0b71b7",
"assets/packages/shuffle_uikit/assets/images/svg/sleep.svg": "e5dde3940913522bd3e328f90fe386c3",
"assets/packages/shuffle_uikit/assets/images/svg/Male.svg": "0fd5fb1fff72a7632d3172df9e7080b1",
"assets/packages/shuffle_uikit/assets/images/svg/label.svg": "e87cb90f6107fcd48a736249f7a0b23b",
"assets/packages/shuffle_uikit/assets/images/svg/docs-outline.svg": "c55c9dc2e0a45a4726d3ecd62438b285",
"assets/packages/shuffle_uikit/assets/images/svg/send.svg": "0a3390eaea611aaad6fa5845be40e1dc",
"assets/packages/shuffle_uikit/assets/images/svg/trash.svg": "d13156653e650c278a272fd90f7c4992",
"assets/packages/shuffle_uikit/assets/images/svg/like.svg": "4730afea8517f1a321fbd17108992deb",
"assets/packages/shuffle_uikit/assets/images/svg/Coin.svg": "31cf2fbec7cdcfe7ea808b0c3579f9bf",
"assets/packages/shuffle_uikit/assets/images/svg/trend-up.svg": "9283b5b92db0e76a9db924c3f39fc47a",
"assets/packages/shuffle_uikit/assets/images/svg/lifebuoy.svg": "892a4542b470e22a24dc6c974995310f",
"assets/packages/shuffle_uikit/assets/images/svg/keyboard.svg": "e423d230e0677662a14fc8140d677809",
"assets/packages/shuffle_uikit/assets/images/svg/Outstanding.svg": "2f5854005bfdb925bdea3cbd200a91a0",
"assets/packages/shuffle_uikit/assets/images/svg/Porthole.svg": "e7b70d4cc41dd9d0a3ad0a361843f347",
"assets/packages/shuffle_uikit/assets/images/svg/search.svg": "17e0d728ccb3111998b7179a3f19a844",
"assets/packages/shuffle_uikit/assets/images/svg/heart-outline.svg": "084af6b3beea7cd0b62732161b497e82",
"assets/packages/shuffle_uikit/assets/images/svg/First-aid-kit.svg": "aaee74bd7bf023005540abfd5e8c9d30",
"assets/packages/shuffle_uikit/assets/images/svg/rising_trend_icon.svg": "83c0a509991cdd825d20d299a9e3d279",
"assets/packages/shuffle_uikit/assets/images/svg/Laughing-with-tears-emoji.svg": "24e0245a35e0b53ddefa9b6a92fe3962",
"assets/packages/shuffle_uikit/assets/images/svg/Heart-in-hand-emoji.svg": "d7d64b5b87383e5fe1a02dd53f992d63",
"assets/packages/shuffle_uikit/assets/images/svg/Feedback.svg": "df05a64b7d69fc2b6819090e8ce457a4",
"assets/packages/shuffle_uikit/assets/images/svg/food.svg": "05779af60b15e2a35f99e72e5585d6ed",
"assets/packages/shuffle_uikit/assets/images/svg/Smile-mood.svg": "31050d9084c8fc77f6d0e83ee8463eb9",
"assets/packages/shuffle_uikit/assets/images/svg/music.svg": "ddc733516e3d0e37b3ecbd201190cd5f",
"assets/packages/shuffle_uikit/assets/images/svg/chevron-down.svg": "0e8a3b356111a03e41270d28c0376c7e",
"assets/packages/shuffle_uikit/assets/images/svg/Binoculars.svg": "8835a40a17b26386dff43f80fdfa8413",
"assets/packages/shuffle_uikit/assets/images/svg/adventure.svg": "3dccba2ed4227befb5550fd80b964455",
"assets/packages/shuffle_uikit/assets/images/svg/search_fill.svg": "42addc56ec866fdaff81307e341441b2",
"assets/packages/shuffle_uikit/assets/images/svg/flag.svg": "38ba24d5bf7b42638a3912bc9c476161",
"assets/packages/shuffle_uikit/assets/images/svg/route.svg": "db4acd663ecb5f09ac46d09e4f325e82",
"assets/packages/shuffle_uikit/assets/images/svg/cocktail.svg": "ba8b564095b9a633a258c25cba4c6915",
"assets/packages/shuffle_uikit/assets/images/svg/camera-plus.svg": "cfce0cafa8444a3697ce756d3e9d3205",
"assets/packages/shuffle_uikit/assets/images/svg/wallet.svg": "e83800ebe86169f1f35455fb528c35be",
"assets/packages/shuffle_uikit/assets/images/svg/Baggage.svg": "a93de3c696211a0c65e6706c0c99f111",
"assets/packages/shuffle_uikit/assets/images/svg/no_photo.svg": "ccb5369bbe124082019ce8ceddbf9cf0",
"assets/packages/shuffle_uikit/assets/images/svg/docs-fill.svg": "c70b66c2a86d05f3e8366230f2eafa10",
"assets/packages/shuffle_uikit/assets/images/svg/Networking.svg": "39a207e7bebcb8938b2f1a0223122045",
"assets/packages/shuffle_uikit/assets/images/svg/memeber_gradient_star.svg": "5994ed27549e8010060fdcb1ce0a779b",
"assets/packages/shuffle_uikit/assets/images/svg/exclamation.svg": "92f6dd4fa5be2fcd30be1bdbdd0354ef",
"assets/packages/shuffle_uikit/assets/images/svg/Smile-in-mask-emoji.svg": "16eb52a7c060e687983323c6adf2e170",
"assets/packages/shuffle_uikit/assets/images/svg/Events.svg": "4b7ba6e401bcbd9668a6cdd26e93d278",
"assets/packages/shuffle_uikit/assets/images/svg/info.svg": "c3f4a3c7a32eb099aa64eab59d56612c",
"assets/packages/shuffle_uikit/assets/images/svg/calendar.svg": "ba60dae8b41ed98fd26d96e27ea9dc2f",
"assets/packages/shuffle_uikit/assets/images/svg/scan.svg": "babbd2c597d515817e6aecce9bcedad1",
"assets/packages/shuffle_uikit/assets/images/svg/location.svg": "c6ae63b71cb70bcf5f2de4c663fed66d",
"assets/packages/shuffle_uikit/assets/images/svg/pencil.svg": "6aad524cad31a273310b4b22f0e5a495",
"assets/packages/shuffle_uikit/assets/images/svg/chevron-up.svg": "a41cfbd2db65880fbe8638d0e5f2e821",
"assets/packages/shuffle_uikit/assets/images/svg/x.svg": "83ab634bac03dfaedcb12a287d03cb21",
"assets/packages/shuffle_uikit/assets/images/svg/Training-apparatus.svg": "0829a57fa2478cb063fa54fbfd4e306f",
"assets/packages/shuffle_uikit/assets/images/svg/building.svg": "81c5ec547b03c65d5ea83a3a41ce27d3",
"assets/packages/shuffle_uikit/assets/images/svg/hookah.svg": "961849b1dbeae6ae7e1de8c328e1ce9f",
"assets/packages/shuffle_uikit/assets/images/svg/spinner_fill.svg": "088f62fb868a278211fa7981ad600aba",
"assets/packages/shuffle_uikit/assets/images/svg/Starry-eyed-excited-emoji.svg": "ec4568884d4fb22165aaa79cc37727e4",
"assets/packages/shuffle_uikit/assets/images/svg/Rockandroll-hands.svg": "af6893af187efed40581b2c460521bd5",
"assets/packages/shuffle_uikit/assets/images/svg/Cocktail-3d.svg": "d9a18e5a3f87237b97e6adfdc4102fd2",
"assets/packages/shuffle_uikit/assets/images/svg/Money.svg": "9938e5347629f2930eff8db33689d051",
"assets/packages/shuffle_uikit/assets/images/svg/Heart-eyes-emoji.svg": "8ea6e5ec9799419d727522141735bdd0",
"assets/packages/shuffle_uikit/assets/images/svg/Clapperboard.svg": "a36d7a8afda3ca96248107721b1bbdcc",
"assets/packages/shuffle_uikit/assets/images/svg/home_fill.svg": "b4085ee09a1a946b41c59ff0de191d01",
"assets/packages/shuffle_uikit/assets/images/svg/tiger.svg": "2587f2f8cd22d98eabc4d2eedc312e6e",
"assets/packages/shuffle_uikit/assets/images/svg/thumb-up.svg": "6e3992d271e7a62ef64d30b1bdced226",
"assets/packages/shuffle_uikit/assets/images/svg/Bell-notification.svg": "ff7f5c5e57eeaf8975698abddfcf9054",
"assets/packages/shuffle_uikit/assets/images/svg/files.svg": "9e5404147c0e9a5c7c518e67c7e86b01",
"assets/packages/shuffle_uikit/assets/images/svg/analytics.svg": "be8aa90317c9b072daba2471b1a8a821",
"assets/packages/shuffle_uikit/assets/images/svg/triple_arrow.svg": "a20eaac4886fab916549ac4271f4b8e7",
"assets/packages/shuffle_uikit/assets/images/svg/Followers.svg": "705f80ae14a68504dd098ba95b9c9578",
"assets/packages/shuffle_uikit/assets/images/svg/star.svg": "d8d6fb15311d965839e0eb4b54b170ac",
"assets/packages/shuffle_uikit/assets/images/svg/profile_fill.svg": "d1007d762ec98c3bee5d58727e873f66",
"assets/packages/shuffle_uikit/assets/images/svg/logout.svg": "57903dcaf463338eb5596b352ea0c94d",
"assets/packages/shuffle_uikit/assets/images/svg/settings.svg": "4426f433653ee09f88d4db7d0c407d45",
"assets/packages/shuffle_uikit/assets/images/svg/white_star.svg": "5a6b30b6a4249a45cb52cfa6b69b42f5",
"assets/packages/shuffle_uikit/assets/images/svg/Puzzle.svg": "65c49180283addb06d7f25629d46afa8",
"assets/packages/shuffle_uikit/assets/images/svg/Sun-clouds.svg": "684aff3de45ba502bcb8187ece05250d",
"assets/packages/shuffle_uikit/assets/images/svg/star-2.svg": "c65cb40ff9b906549425fdf17f535f0d",
"assets/packages/shuffle_uikit/assets/images/svg/Rocket.svg": "310bb27bf32fc5f31d7ba9ce2b297ddd",
"assets/packages/shuffle_uikit/assets/images/svg/Fire.svg": "981951643078102cc8065f17cb3afe41",
"assets/packages/shuffle_uikit/assets/images/svg/Mango.svg": "90581088bbce688abf4a4964d932c42e",
"assets/packages/shuffle_uikit/assets/images/svg/Sun-wind.svg": "8893a31a47df2a845d5a5e027e7b1a31",
"assets/packages/shuffle_uikit/assets/images/svg/spinner_outline.svg": "0145b2f712b6af75809b3f7de78bcc25",
"assets/packages/shuffle_uikit/assets/images/svg/influencer_account_mark.svg": "d89b43a0db133af43e61a6a899f39686",
"assets/packages/shuffle_uikit/assets/images/svg/Smiley-crazy-face-emoji.svg": "8a114ddc39da795246ac6a842a680157",
"assets/packages/shuffle_uikit/assets/images/svg/dice.svg": "23693db9ab3b00e5622ec6e4b06a736c",
"assets/packages/shuffle_uikit/assets/images/svg/connection-fill.svg": "92f40f009d9a78b9e4d9c07cea7f7d5d",
"assets/packages/shuffle_uikit/assets/images/svg/Femle.svg": "72276685c4c754821e11068afb44b4c2",
"assets/packages/shuffle_uikit/assets/images/svg/fire_white.svg": "dcffa69e555f17e4caa6b9eb4552e8f2",
"assets/packages/shuffle_uikit/assets/images/svg/plus.svg": "b93245de58bdad1b09565df3429834de",
"assets/packages/shuffle_uikit/assets/images/svg/Ski.svg": "b5302cdd070b401da0a5bc3c86800d16",
"assets/packages/shuffle_uikit/assets/images/svg/dollar.svg": "1d9dc011cb2152d2796122e18552a4d1",
"assets/packages/shuffle_uikit/assets/images/svg/Dart.svg": "6f03a9e06dfc8d204944d2450473eff6",
"assets/packages/shuffle_uikit/assets/images/svg/profile-plus.svg": "67ec6f47dc22a4e220a65ac7f1af38c6",
"assets/packages/shuffle_uikit/assets/images/svg/big_arrow.svg": "43e63101ed2f0090b4bd1aa5e2bbf20a",
"assets/packages/shuffle_uikit/assets/images/svg/stop.svg": "022995e077542524cc2767e5c558463e",
"assets/packages/shuffle_uikit/assets/images/svg/mask.svg": "cb2b44b7698e277f8358d19595f683ac",
"assets/packages/shuffle_uikit/assets/images/svg/Victory-hands.svg": "270801b53be462aee42594a532493e40",
"assets/packages/shuffle_uikit/assets/images/svg/chess.svg": "cc98afcb4845033adca84546eea19cae",
"assets/packages/shuffle_uikit/assets/images/svg/shuffle_outline.svg": "67ad5477b2cb340b26c53a84235d8488",
"assets/packages/shuffle_uikit/assets/images/svg/trend-down.svg": "d0d1d6a62721336d868432e13732786b",
"assets/packages/shuffle_uikit/assets/images/svg/settings-outline.svg": "67e5448f6a60c40b2972c643f6ee6d0c",
"assets/packages/shuffle_uikit/assets/images/svg/chevron-left.svg": "d5ff28fbfcbc7387920ec38a76e9de39",
"assets/packages/shuffle_uikit/assets/images/svg/logo.svg": "dc028fad2ba8e5e0972ffc032a125523",
"assets/packages/shuffle_uikit/assets/images/svg/Grinning-face-with-sweat-emoji.svg": "3e6de6a8337984a235c522eb12d1197d",
"assets/packages/shuffle_uikit/assets/images/svg/athlete.svg": "2f3f9b2bc7c6e98d88880a97d147326c",
"assets/packages/shuffle_uikit/assets/images/svg/Cocktail-2.svg": "960f410dc85ec4a6e6620898d094c5fd",
"assets/packages/shuffle_uikit/assets/images/svg/pause.svg": "df340f1f202ecf20a324a8ba41ef6eeb",
"assets/packages/shuffle_uikit/assets/images/svg/check_circle.svg": "5b053982b73b2ef0ed099d2772554f1b",
"assets/packages/shuffle_uikit/assets/images/svg/swim.svg": "4bccc50ad5aa8d45ad31ac6506ce6824",
"assets/packages/shuffle_uikit/assets/images/svg/Company.svg": "089a1434058f9192d17f8733717ec348",
"assets/packages/shuffle_uikit/assets/images/svg/premium_account_mark.svg": "e8ed7d52a6914035baff81f7f7d4d94f",
"assets/packages/shuffle_uikit/assets/images/svg/analytics-fill.svg": "1e695d9a8138759212f69c62db9deea5",
"assets/packages/shuffle_uikit/assets/images/svg/Like-hands.svg": "4f2828152b45a1d8d1088e650a15283c",
"assets/packages/shuffle_uikit/assets/images/svg/Yoga.svg": "3734d10701842716d9d46f082dee7170",
"assets/packages/shuffle_uikit/assets/images/svg/barcode.svg": "d506cb8aceb1247ef24b8c1409eef405",
"assets/packages/shuffle_uikit/assets/images/svg/shuffle_white.svg": "8ebf1822ad6e669c7e3d21298b4ae897",
"assets/packages/shuffle_uikit/assets/images/svg/bath.svg": "cba7cb8d7446402556de41b65665af1b",
"assets/packages/shuffle_uikit/assets/images/svg/Hi-new-invitees.svg": "698e0c3b2aad6d955aa18433d5d3083d",
"assets/packages/shuffle_uikit/assets/images/svg/Lifebuoy-3d.svg": "081634c6feea826ca18ba041fa369a4c",
"assets/packages/shuffle_uikit/assets/images/svg/pro_account_mark.svg": "74290d06de478f1211bc4f67884957b0",
"assets/packages/shuffle_uikit/assets/images/svg/Laptop-with-chart.svg": "9b456ae5ae953df1ed1e54f07a537018",
"assets/packages/shuffle_uikit/assets/images/svg/settings-fill.svg": "31ca27c7f3247980ca4634ac50dccc21",
"assets/packages/shuffle_uikit/assets/images/svg/heart-fill.svg": "1b5842e9214f22013abb55618af1fef9",
"assets/packages/shuffle_uikit/assets/images/svg/question.svg": "ece032f6c038befa4f0dadcab5ca6df1",
"assets/packages/shuffle_uikit/assets/images/svg/pointy-head.svg": "2a8e20fa3e37cdbc95ce78f264217c3a",
"assets/packages/shuffle_uikit/assets/images/svg/star-outline.svg": "ffa823476e03d750b0bc86cade67649e",
"assets/packages/shuffle_uikit/assets/images/svg/home_outline.svg": "a75a9944c8c869219686c425eff1740b",
"assets/packages/shuffle_uikit/assets/images/svg/Donations.svg": "6f45245b2ac33225c6392bf04630ec74",
"assets/packages/shuffle_uikit/assets/images/svg/sufle.svg": "0ceef844db9713f0f870b54d22d9a27e",
"assets/packages/shuffle_uikit/assets/images/svg/Ok-hands.svg": "1d1432335895e8047b406644c876eae2",
"assets/packages/shuffle_uikit/assets/images/svg/connection-outline.svg": "3a8950affccdfccccc5b1dc6f17bfcec",
"assets/packages/shuffle_uikit/assets/images/svg/warning.svg": "a6c44d14d3baa097bd55c4b94284c57f",
"assets/packages/shuffle_uikit/assets/images/svg/history.svg": "a329bda6e3ed3af025f4ec8c10c816d9",
"assets/packages/shuffle_uikit/assets/images/svg/Icecream.svg": "40b0ec9631afe088371cf1ffdcda597d",
"assets/packages/shuffle_uikit/assets/images/svg/Other-gender.svg": "0c71d1fcbc8b08b6a36517aece66c473",
"assets/packages/shuffle_uikit/assets/images/svg/check.svg": "d12b4bce4697bc6309ca7a30391a4b92",
"assets/packages/shuffle_uikit/assets/images/svg/more-vert.svg": "938097acabe33ab519a6110de169bcc2",
"assets/packages/shuffle_uikit/assets/images/svg/armchair.svg": "4151cae0fb59c0fc694aa5f877183d5e",
"assets/packages/shuffle_uikit/assets/images/svg/Key.svg": "f726eae20a6cf8f0a57b3f2363873163",
"assets/packages/shuffle_uikit/assets/images/svg/water.svg": "e2a9cb48863e78a7003c3792f8670d52",
"assets/packages/shuffle_uikit/assets/images/svg/Map.svg": "ccbc4bfc15263c340136cce31aafa204",
"assets/packages/shuffle_uikit/assets/images/svg/minus.svg": "ee5a45f8674bef83054e5a68fb0b0ed1",
"assets/packages/shuffle_uikit/assets/images/svg/profile_outline.svg": "18e0e32803581afd993f55cbd9b5a596",
"assets/packages/shuffle_uikit/assets/images/svg/Index-finger-hands.svg": "89bea09fe7379f9798751a2f240863e4",
"assets/packages/shuffle_uikit/assets/images/svg/tripple_arrow_black.svg": "b73f1087bfcde3dda819809e9fb06377",
"assets/packages/shuffle_uikit/assets/images/svg/shuffle_fill.svg": "3f24bfeba5ddad044fc75945c04096b4",
"assets/packages/shuffle_uikit/assets/images/svg/video-plus.svg": "f13ea04a5da38011432720c61da3963d",
"assets/packages/shuffle_uikit/assets/images/svg/diamond.svg": "940e90ce4c86a6ca603925d17f62df89",
"assets/packages/shuffle_uikit/assets/images/svg/Giving-like-emoji.svg": "17da27fe6dec2498c471349fabde3449",
"assets/packages/shuffle_uikit/assets/images/svg/archive.svg": "1a37ccd29e696307dcf2a2f675cbba94",
"assets/packages/shuffle_uikit/assets/images/svg/chevron-up-long.svg": "e4a3c3dae5a4c1bbe80556e506e5d19d",
"assets/packages/shuffle_uikit/assets/images/svg/search-people.svg": "9d426c3557de6355d303d84743b7562d",
"assets/packages/shuffle_uikit/assets/images/svg/arrow-left.svg": "a7231dd6bae5e689da3de61a8a35c3e8",
"assets/packages/shuffle_uikit/assets/images/svg/play.svg": "82424c09d68ae6f13457c068c2f98d6b",
"assets/packages/shuffle_uikit/assets/images/svg/play_arrow.svg": "ae8539c4674169651d1e56c9931f735b",
"assets/packages/shuffle_uikit/assets/images/svg/chevron-right.svg": "d48ddb05309140eceab45c4be1bd7c73",
"assets/packages/shuffle_uikit/assets/images/svg/bell.svg": "52bcbf849358856b4599918a09e69491",
"assets/packages/shuffle_uikit/assets/images/svg/cutlery.svg": "bee4dea4ca223f0dfb7af14ffcce50ba",
"assets/packages/shuffle_uikit/assets/images/svg/search_outline.svg": "32c937dc1e32db510f890c8e52aac075",
"assets/packages/shuffle_uikit/assets/images/svg/satelite.svg": "11e4dd062370461394b092ae11a06898",
"assets/packages/shuffle_uikit/assets/images/svg/landmark.svg": "f8b761ef1a739574eb3d5fe1c3f10ead",
"assets/packages/shuffle_uikit/assets/images/svg/Aubergine.svg": "48fa1d780c6df6f4d42520adc97fa006",
"assets/packages/shuffle_uikit/assets/images/svg/star-fill.svg": "91d5883cdd4c32ac61d4568864c9a606",
"assets/packages/shuffle_uikit/assets/images/svg/Angry-emoji.svg": "4e07531b04bd1c482631ee9436e5b0dc",
"assets/packages/shuffle_uikit/assets/images/svg/user.svg": "d7e9b0fbe8e77b33cbdd0104cd2fc579",
"assets/packages/shuffle_uikit/assets/images/svg/hand-shake.svg": "14eae8d3e687202d75e7029dfdb3afe4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/countries_flag/assets/flags/azerbaijan.svg": "21d758f5a0ba848465bf0e83d3cca561",
"assets/packages/countries_flag/assets/flags/australia.svg": "20e1a9dde284bef4197a37695c4a0e02",
"assets/packages/countries_flag/assets/flags/transnistria.svg": "d8daa2a56e94469fe37519ba8f349043",
"assets/packages/countries_flag/assets/flags/gambia.svg": "5bf0ad96978ab69514e925fbdd22a20a",
"assets/packages/countries_flag/assets/flags/yemen.svg": "18a00433928364d70c3bb37e7df12256",
"assets/packages/countries_flag/assets/flags/central_african_republic.svg": "cc9580e325be1347c429e354364bc2be",
"assets/packages/countries_flag/assets/flags/morocco.svg": "d8b2566ca212b616a2667fcf8f42875e",
"assets/packages/countries_flag/assets/flags/niger.svg": "10cd1dd204819c5014ddc93ecaeee810",
"assets/packages/countries_flag/assets/flags/sierra_leone.svg": "1cbff6989dbf1a5fd0b0d2c75a14c552",
"assets/packages/countries_flag/assets/flags/honduras.svg": "e337a5c278f8a85e27e2ba16100ddabf",
"assets/packages/countries_flag/assets/flags/el_salvador.svg": "374fb0c641642b2ecc9f2c03287d81d9",
"assets/packages/countries_flag/assets/flags/pitcairn_islands.svg": "f7e722f5d61c7ebeb8e23149f8e1458d",
"assets/packages/countries_flag/assets/flags/fiji.svg": "9e00e1d236622101682a00d7fcf2ad1b",
"assets/packages/countries_flag/assets/flags/gibraltar.svg": "cee58fc176fe8e5c7b84d4bc0d249ddc",
"assets/packages/countries_flag/assets/flags/tokelau.svg": "d2e09722696e3b3c1a09cf5562b99b53",
"assets/packages/countries_flag/assets/flags/marshall_island.svg": "b15dc581601d421bb09b6f40bb8cd1a6",
"assets/packages/countries_flag/assets/flags/scotland.svg": "2447acbf8119f08a78d2bcf3c421e2d0",
"assets/packages/countries_flag/assets/flags/france.svg": "5e0abb6d24264435255a8f94c369ac1d",
"assets/packages/countries_flag/assets/flags/cyprus.svg": "e601f3ec9e91615b1fb62652786f4990",
"assets/packages/countries_flag/assets/flags/eritrea.svg": "a210531ad6491f0a2246e79a35beea43",
"assets/packages/countries_flag/assets/flags/cameroon.svg": "c26ae16ee00d1e4b7eecc40276c88541",
"assets/packages/countries_flag/assets/flags/kuwait.svg": "b9e6a0afe66e7c74eb0cd2b1c720b8d2",
"assets/packages/countries_flag/assets/flags/aland_islands.svg": "b7783c2052e9f56b082d5f3b663f749f",
"assets/packages/countries_flag/assets/flags/montserrat.svg": "1454af32e0eeea9f20fd3f9319c11293",
"assets/packages/countries_flag/assets/flags/bosnia_and_herzegovina.svg": "44275f55b8902756eab5176bd77b6895",
"assets/packages/countries_flag/assets/flags/switzerland.svg": "44bc60e868f0c3bcfd6bf94d50530373",
"assets/packages/countries_flag/assets/flags/canada.svg": "cd93c99d041477247eab36082665b01f",
"assets/packages/countries_flag/assets/flags/anguilla.svg": "c977eebbd836d77dc1489988c35372ec",
"assets/packages/countries_flag/assets/flags/curacao.svg": "10d33761f7f363e842c7ebf350db9d10",
"assets/packages/countries_flag/assets/flags/azores_islands.svg": "d52aa259667a6edc683ed77a65a44fa5",
"assets/packages/countries_flag/assets/flags/micronesia.svg": "20361d0876e4b2db84d7c6630bf46f3f",
"assets/packages/countries_flag/assets/flags/british_columbia.svg": "3a2771e7e109fa3efd98634ab296ba4f",
"assets/packages/countries_flag/assets/flags/new_zealand.svg": "64c3bf6ca9d1ab85cbcb4a16b2890bcb",
"assets/packages/countries_flag/assets/flags/hong_kong.svg": "c38b1b44da1e99cb35277e869b76acb4",
"assets/packages/countries_flag/assets/flags/liberia.svg": "106be622851f2512fe61e56d369d9074",
"assets/packages/countries_flag/assets/flags/czech_republic.svg": "84107450f346b14a5ecf17ab00572b1a",
"assets/packages/countries_flag/assets/flags/iraq.svg": "a66084d59cbf7936e631e5dd2dcacd22",
"assets/packages/countries_flag/assets/flags/saudi_arabia.svg": "3f855b7a698dc807113d4a35b104dae8",
"assets/packages/countries_flag/assets/flags/tubalu.svg": "fe6c8557c9e768ee16e2e83a61a4adbd",
"assets/packages/countries_flag/assets/flags/moldova.svg": "c0b9315dd54490d6ae1045b2328337cd",
"assets/packages/countries_flag/assets/flags/basque_country.svg": "f2e31a13eec058c85555b5ac154c6202",
"assets/packages/countries_flag/assets/flags/vatican_city.svg": "cf0a575ebb9bf991bf7c3d738ea3b3da",
"assets/packages/countries_flag/assets/flags/paraguay.svg": "6215d36dccc97d9fef23719de7ab55da",
"assets/packages/countries_flag/assets/flags/colombia.svg": "cda3f8a0f85877952bf8904e32bd40e1",
"assets/packages/countries_flag/assets/flags/american_samoa.svg": "d6cc54418985eaafb4ee1ca2ee424925",
"assets/packages/countries_flag/assets/flags/madagascar.svg": "c7023479295cb78dbaaa687c90de5dee",
"assets/packages/countries_flag/assets/flags/mali.svg": "935bff845f08064e6aa7771c4ce3842b",
"assets/packages/countries_flag/assets/flags/benin.svg": "45c7eac14b90c3dfa21fdba1d4e0e888",
"assets/packages/countries_flag/assets/flags/venezuela.svg": "da2354c1966dda71f78c93b728c44be7",
"assets/packages/countries_flag/assets/flags/angola.svg": "98a7264ee753c1798d7b52038ff5e95a",
"assets/packages/countries_flag/assets/flags/cocos_island.svg": "b4515f6638be34cf0700a64c54e5521c",
"assets/packages/countries_flag/assets/flags/qatar.svg": "44f941465e038798e71feeebf540c1c1",
"assets/packages/countries_flag/assets/flags/melilla.svg": "eabe81e0744cb616d882df30bc40abdf",
"assets/packages/countries_flag/assets/flags/orkney_islands.svg": "3387513731686f58eab8ddd4b6984225",
"assets/packages/countries_flag/assets/flags/cook_islands.svg": "b13749cc8d07b8cbf64d22c8fc3e5580",
"assets/packages/countries_flag/assets/flags/north_korea.svg": "88ba03ae68b5b11a3892a93a36c0b203",
"assets/packages/countries_flag/assets/flags/saba_island.svg": "c5fa027bf7f3001585e1579a1975be52",
"assets/packages/countries_flag/assets/flags/mauritania.svg": "f8e0d0c4fb5906caf3022bdc122d9109",
"assets/packages/countries_flag/assets/flags/poland.svg": "013b173c83c84150a4a4f621d1792e63",
"assets/packages/countries_flag/assets/flags/sri_lanka.svg": "5d97e2610696ac7f21d2d5c0fbfce803",
"assets/packages/countries_flag/assets/flags/madeira.svg": "750586712d701ea568ae1a50d4672953",
"assets/packages/countries_flag/assets/flags/vanuatu.svg": "df3a09ec71e1528c6a22ffcddefda0a9",
"assets/packages/countries_flag/assets/flags/galapagos_islands.svg": "0d3c4d13164d1573fa9fa9b1ddf2c54c",
"assets/packages/countries_flag/assets/flags/jordan.svg": "de759a327786fd1756cf737eaf03a2d1",
"assets/packages/countries_flag/assets/flags/croatia.svg": "84ee78b42d414dab030869486fb9d879",
"assets/packages/countries_flag/assets/flags/guernsey.svg": "2af02a67d71690fbbb14b4dbe5fc08cb",
"assets/packages/countries_flag/assets/flags/mongolia.svg": "060615e89c3b21c865b552e459330524",
"assets/packages/countries_flag/assets/flags/south_sudan.svg": "8e886d0b11c7a12e08029c9b54d791af",
"assets/packages/countries_flag/assets/flags/nigeria.svg": "91c0171f0820ac4a824bb6cd8823fc05",
"assets/packages/countries_flag/assets/flags/jersey.svg": "03b25de01a14d73c62b3580725d1d6bf",
"assets/packages/countries_flag/assets/flags/united_arab_emirates.svg": "9ac6426eb89996496ecc4b5a82344b2e",
"assets/packages/countries_flag/assets/flags/palau.svg": "d411267e7582f8ebb5616ad5b7fd1590",
"assets/packages/countries_flag/assets/flags/germany.svg": "35d055855ee8b4a221308ace04343526",
"assets/packages/countries_flag/assets/flags/papua_new_guinea.svg": "ca943054d1b5320bdcd4cf534b9724c3",
"assets/packages/countries_flag/assets/flags/faroe_islands.svg": "a0496b3703e02b525c6d3fec15417a5b",
"assets/packages/countries_flag/assets/flags/norfolk_island.svg": "c11dcf7ecc23c36b1f34df0c209b36ef",
"assets/packages/countries_flag/assets/flags/trinidad_and_tobago.svg": "d58f8324665cb3b09a42f92c3b8123d4",
"assets/packages/countries_flag/assets/flags/zimbabwe.svg": "5254ed8c78288037822604a8d73d2218",
"assets/packages/countries_flag/assets/flags/united_states_of_america.svg": "cfe34e9f0aee58b9de91362c139a90bd",
"assets/packages/countries_flag/assets/flags/bahrain.svg": "1de2e1df07b810fcdf292a0a8ac37ac2",
"assets/packages/countries_flag/assets/flags/french_polynesia.svg": "0be0d1e6eb120b0f60df428d4ea0829c",
"assets/packages/countries_flag/assets/flags/otan.svg": "dd77530412fb51f813bc47a304d2bd33",
"assets/packages/countries_flag/assets/flags/uruguay.svg": "ee0bcc9e941ee1e151313a367223f5fb",
"assets/packages/countries_flag/assets/flags/ivory_coast.svg": "3bf6615b31797e79767e9b11743d1cf3",
"assets/packages/countries_flag/assets/flags/bahamas.svg": "c78e3f7ca65802a36e37fe0ace91bb29",
"assets/packages/countries_flag/assets/flags/comoros.svg": "6ca7903e4cd2a0b47ad0e7d46c9b2467",
"assets/packages/countries_flag/assets/flags/corsica.svg": "e858459cf008d4e781159d7488ab42a1",
"assets/packages/countries_flag/assets/flags/armenia.svg": "edb51ad9e65c9749d56a24aac374b485",
"assets/packages/countries_flag/assets/flags/united_kingdom.svg": "a1e1c5bb69a7224fba2851064a3aa65c",
"assets/packages/countries_flag/assets/flags/guinea.svg": "2d2d1d7ef305b876508416ed8d1e8c15",
"assets/packages/countries_flag/assets/flags/finland.svg": "73333e8dc124255d4cae135677e0578a",
"assets/packages/countries_flag/assets/flags/tibet.svg": "f86d7dddf140e385594dd588f2567521",
"assets/packages/countries_flag/assets/flags/argentina.svg": "e5f325f17edd02e84f0c99812deb4424",
"assets/packages/countries_flag/assets/flags/romania.svg": "bcb5854af92fa8a1fdc106a4819fc85c",
"assets/packages/countries_flag/assets/flags/bermuda.svg": "2ab62030c91e694e4f284da401688f6c",
"assets/packages/countries_flag/assets/flags/serbia.svg": "089a4cc2b575aaf87871aaa7cec4d220",
"assets/packages/countries_flag/assets/flags/norway.svg": "c3c67744db7aa1367960051c819fb6b7",
"assets/packages/countries_flag/assets/flags/kazakhstan.svg": "978d5804055282848e062d0522f9d7c5",
"assets/packages/countries_flag/assets/flags/malawi.svg": "5d70b794e2293f0d220fe69c77b336e7",
"assets/packages/countries_flag/assets/flags/canary_islands.svg": "38bb7df45a93274643b5aa1640c99413",
"assets/packages/countries_flag/assets/flags/rwanda.svg": "8ac60deb1a0cc18de300d9d44ec71700",
"assets/packages/countries_flag/assets/flags/singapore.svg": "46b385e05e822814d9f054200e34e1d7",
"assets/packages/countries_flag/assets/flags/tonga.svg": "cbadf16e9f98e542b7ff7a777e7b0155",
"assets/packages/countries_flag/assets/flags/nepal.svg": "ff48a6345c42a3d9f695c9fb126d9a6d",
"assets/packages/countries_flag/assets/flags/bulgaria.svg": "429f8ff1d06c88e72323d91756017cbc",
"assets/packages/countries_flag/assets/flags/togo.svg": "c5753fd81bfeae6ce16230215b0b0027",
"assets/packages/countries_flag/assets/flags/mauritius.svg": "69a7cb3213400d42120cbe64b887362c",
"assets/packages/countries_flag/assets/flags/falkland_islands.svg": "56af14b664ffef8dcbbc1f847b804c0e",
"assets/packages/countries_flag/assets/flags/antigua_and_barbuda.svg": "230c55b5e9743d59609576fef6c67ace",
"assets/packages/countries_flag/assets/flags/cayman_islands.svg": "6088272d3e564fc1a19ed43f10b09760",
"assets/packages/countries_flag/assets/flags/panama.svg": "ecb0bba1157bf15f8e7495f462e098fc",
"assets/packages/countries_flag/assets/flags/brazil.svg": "6433184cff457c3510e91c3e51fc6bc3",
"assets/packages/countries_flag/assets/flags/philippines.svg": "6f113e64644d00fb716cfc33692333bc",
"assets/packages/countries_flag/assets/flags/dominican_republic.svg": "f5131bb020f4a3b492662258afca4b27",
"assets/packages/countries_flag/assets/flags/guam.svg": "1e2988b6d4dcfe53ee019474e1662c24",
"assets/packages/countries_flag/assets/flags/brunei.svg": "32663da65728450bd7a0c9dd68201233",
"assets/packages/countries_flag/assets/flags/oman.svg": "00398ce6e62e5bb6374687b9ca534267",
"assets/packages/countries_flag/assets/flags/burundi.svg": "4930bef1df3b2195a30cde487305b4df",
"assets/packages/countries_flag/assets/flags/senegal.svg": "fdf95578b2f29ce6642e1aa7a1dd7f96",
"assets/packages/countries_flag/assets/flags/south_korea.svg": "d825908233beb348aeda9c96e168d77e",
"assets/packages/countries_flag/assets/flags/monaco.svg": "575ab3593c1b8b7d77c54861ad22931b",
"assets/packages/countries_flag/assets/flags/greenland.svg": "0ccf0916610a65e6ca563776552c618c",
"assets/packages/countries_flag/assets/flags/chad.svg": "b30505f91251f29626ed1bf835fb10c8",
"assets/packages/countries_flag/assets/flags/dominica.svg": "ac4dd75541120e3fe5155747463ec742",
"assets/packages/countries_flag/assets/flags/british_virgin_islands.svg": "191cd86aab397a70f5b01eb196ed8902",
"assets/packages/countries_flag/assets/flags/san_marino.svg": "371b71883e1c984feea56b44d9debc3a",
"assets/packages/countries_flag/assets/flags/sao_tome_and_principe.svg": "b303f7951bc268e5399f848d784b0a48",
"assets/packages/countries_flag/assets/flags/england.svg": "5823d32b47251ceac6859dc62de864c0",
"assets/packages/countries_flag/assets/flags/rapa-nui.svg": "24355ed61bb721b32eaa1b4d6bca264a",
"assets/packages/countries_flag/assets/flags/somaliland.svg": "14e9596d043b677de45459ecfae01cb0",
"assets/packages/countries_flag/assets/flags/kenya.svg": "9d70ef8f9c76d4bbe1b1b3f5bc28a39b",
"assets/packages/countries_flag/assets/flags/albania.svg": "2ea5c1757f55f17b584af645c5ec6745",
"assets/packages/countries_flag/assets/flags/lesotho.svg": "761e93e70550a0675da0b7350cabbb22",
"assets/packages/countries_flag/assets/flags/malaysia.svg": "e7cf3159bc35d013938e1c1a3c80c411",
"assets/packages/countries_flag/assets/flags/luxembourg.svg": "01b78f1ce2120c1edc9c6e3df500e767",
"assets/packages/countries_flag/assets/flags/turkey.svg": "b79d62b6c653d2cc50a788c3772d9c14",
"assets/packages/countries_flag/assets/flags/djibouti.svg": "437957c059fc4e0d78d79caac03e27a7",
"assets/packages/countries_flag/assets/flags/saint_kitts_and_nevis.svg": "3744bf0a70a20eac321026c53fb4f808",
"assets/packages/countries_flag/assets/flags/barbados.svg": "b1153dbc27b157d9be90ab26a080a1bc",
"assets/packages/countries_flag/assets/flags/costa_rica.svg": "3102a9d592c5b908b91612f8cf7b6af4",
"assets/packages/countries_flag/assets/flags/sahrawi_arab_democratic_republic.svg": "94d8098c214f0aa0f1edd4aa7a53bf77",
"assets/packages/countries_flag/assets/flags/sint_eustatius.svg": "35c678dff1249117c710a2ebb4653363",
"assets/packages/countries_flag/assets/flags/pakistan.svg": "3c0b1880c5659dd5429ff948cb6e1448",
"assets/packages/countries_flag/assets/flags/turkmenistan.svg": "84c785dfaa5e914e9e23c311d4aeee23",
"assets/packages/countries_flag/assets/flags/sint_maarten.svg": "c04603280345c2d9e5524daf7be69281",
"assets/packages/countries_flag/assets/flags/cuba.svg": "7f75f1a7088eaaf884ed2271076698e7",
"assets/packages/countries_flag/assets/flags/ukraine.svg": "3a10f71cb0c189e589175ef2ff4c7397",
"assets/packages/countries_flag/assets/flags/ghana.svg": "b6d74767d9504ed9093ca70b0e42420a",
"assets/packages/countries_flag/assets/flags/st_barts.svg": "09d14492eaf79d3fc465751e1736b45a",
"assets/packages/countries_flag/assets/flags/solomon_islands.svg": "43f4e6154b62f59ac9c71b9904c49ee6",
"assets/packages/countries_flag/assets/flags/slovenia.svg": "59b84b066cccf77017fb8e770476890c",
"assets/packages/countries_flag/assets/flags/kosovo.svg": "a5264094fe248aef89cac0fdc38136e2",
"assets/packages/countries_flag/assets/flags/nicaragua.svg": "63ee570c06f9ecac0b14b4fd121cb18d",
"assets/packages/countries_flag/assets/flags/egypt.svg": "37791ef8442528439af24c72b0e174e2",
"assets/packages/countries_flag/assets/flags/iran.svg": "2f2eec98247207214c6f6526ced6a5cc",
"assets/packages/countries_flag/assets/flags/chile.svg": "0e51ddff9d80157abc89d65f34c97bae",
"assets/packages/countries_flag/assets/flags/abkhazia.svg": "508e2b45fb2228a4c7301f24852c05b4",
"assets/packages/countries_flag/assets/flags/south_africa.svg": "53038e4c72af0da9fb1d35cdbab3768f",
"assets/packages/countries_flag/assets/flags/sudan.svg": "b653af4f54870cab1ae53b18d6f801dc",
"assets/packages/countries_flag/assets/flags/mozambique.svg": "977ff458a06f148f933079d3c9ad14eb",
"assets/packages/countries_flag/assets/flags/bolivia.svg": "5c983435408d16bd974bd638e33a7e21",
"assets/packages/countries_flag/assets/flags/laos.svg": "39f967f323cbcd0a2037fc09ac366cb6",
"assets/packages/countries_flag/assets/flags/zambia.svg": "e145333f47bd0da870debbaa0c42b78d",
"assets/packages/countries_flag/assets/flags/liechtenstein.svg": "81968416b2afe27c72a155c865f63378",
"assets/packages/countries_flag/assets/flags/bangladesh.svg": "a2167729fff6768d396daa39cb439442",
"assets/packages/countries_flag/assets/flags/lebanon.svg": "7c0d6d4f24a25c9a84b3397aa277757a",
"assets/packages/countries_flag/assets/flags/ceuta.svg": "2cef4f9811a03f05cd051c6a49e10309",
"assets/packages/countries_flag/assets/flags/hawaii.svg": "99dfcb667c33a779e2a20d05e6456e81",
"assets/packages/countries_flag/assets/flags/lithuania.svg": "275e1ca04c92cc705411786cac275780",
"assets/packages/countries_flag/assets/flags/martinique.svg": "829ad47dca6c235ebfd21cd075a831fd",
"assets/packages/countries_flag/assets/flags/guinea_bissau.svg": "5e82726390671c9d5f6c1b9131aa8cd6",
"assets/packages/countries_flag/assets/flags/wales.svg": "c476b0ffec5c4e21cccb5ad6eaa6afa4",
"assets/packages/countries_flag/assets/flags/uzbekistan.svg": "22abe5149ad309485368bf5525c80401",
"assets/packages/countries_flag/assets/flags/china.svg": "881e644277e9420ac99138cb8d25c601",
"assets/packages/countries_flag/assets/flags/afghanistan.svg": "b85a312c1521071f8d2c175d45833ff4",
"assets/packages/countries_flag/assets/flags/italy.svg": "fa7e3580e68bdcdc525429f370aeed70",
"assets/packages/countries_flag/assets/flags/samoa.svg": "d8c1ee6af3eb95818ff83ab638f34789",
"assets/packages/countries_flag/assets/flags/syria.svg": "25f3f61d809d067292119a947b9a3556",
"assets/packages/countries_flag/assets/flags/balearic_islands.svg": "1f974d7e7324a76302b1ed926a05a7e1",
"assets/packages/countries_flag/assets/flags/cambodia.svg": "6ebda2a6f7c9e0959cb9224facf24bdd",
"assets/packages/countries_flag/assets/flags/virgin_islands.svg": "ef1781110b2565bdf8f462de146945e4",
"assets/packages/countries_flag/assets/flags/hungary.svg": "56d8fa5d2ef2f36b7956f9bc367adc9a",
"assets/packages/countries_flag/assets/flags/seychelles.svg": "90b47ef400a714b99d8f12a799d5264b",
"assets/packages/countries_flag/assets/flags/andorra.svg": "1ba3228d4e7bb65b6dd6396eaf331304",
"assets/packages/countries_flag/assets/flags/democratic_republic_of_congo.svg": "029453adab38c29940a8d4652ce6d714",
"assets/packages/countries_flag/assets/flags/african.svg": "c8aad7ae252a9028faf6d54c03cc155d",
"assets/packages/countries_flag/assets/flags/aruba.svg": "c4750484d20efa83ce38dbc4ead70269",
"assets/packages/countries_flag/assets/flags/iceland.svg": "3964b80338a58ba239575169e950f7a4",
"assets/packages/countries_flag/assets/flags/myanmar.svg": "c3ee98821eb6fb96ba5014b611413eaf",
"assets/packages/countries_flag/assets/flags/montenegro.svg": "cc87bc6a880cfa1366e7bf4d37a80ff5",
"assets/packages/countries_flag/assets/flags/taiwan.svg": "ddbdd2a8db625f2816fcc8728af1f90b",
"assets/packages/countries_flag/assets/flags/israel.svg": "a6ee552b39b576bf826c849c18c2bab4",
"assets/packages/countries_flag/assets/flags/sardinia.svg": "e495669355d22804115d4c2090425dc8",
"assets/packages/countries_flag/assets/flags/ethiopia.svg": "b0d4b61da008b2abc1c24a995c1eca9e",
"assets/packages/countries_flag/assets/flags/united_nations.svg": "56efdfcc7ce164735dc4dadc9bb085d0",
"assets/packages/countries_flag/assets/flags/latvia.svg": "5ff7dcf25bcfe90d23e4fc5245788e6f",
"assets/packages/countries_flag/assets/flags/bhutan.svg": "a98429038f667215ffd2f7893ec599fd",
"assets/packages/countries_flag/assets/flags/kyrgyzstan.svg": "eaa5873c1c109cbbee9fc3effad7e107",
"assets/packages/countries_flag/assets/flags/peru.svg": "082f41b2d81a3a9068a157d354b2e5d4",
"assets/packages/countries_flag/assets/flags/tajikistan.svg": "e940081e1624b75cdc2bb6e5a9951bac",
"assets/packages/countries_flag/assets/flags/greece.svg": "59b682f6aa16f3f1e42f677bca8b0161",
"assets/packages/countries_flag/assets/flags/maldives.svg": "a1d660f5dbb5e4ca5d9743d2e5350aa6",
"assets/packages/countries_flag/assets/flags/somalia.svg": "76a6f79cd957fc13ac4002a04c2cb22e",
"assets/packages/countries_flag/assets/flags/northen_cyprus.svg": "07763a0994e8eee95f593cb6e3314f4b",
"assets/packages/countries_flag/assets/flags/ireland.svg": "2fbdbca705a62cc7495f7b85ea0caf09",
"assets/packages/countries_flag/assets/flags/christmas_island.svg": "565eddc9c9d1170c71f0b3b423137c69",
"assets/packages/countries_flag/assets/flags/palestine.svg": "f6311420d29ec20dce7d58151380bebe",
"assets/packages/countries_flag/assets/flags/grenada.svg": "c48f473b5ceffd412ebd83e4cd40cc35",
"assets/packages/countries_flag/assets/flags/japan.svg": "63fcafe755ac89a0a0c10da5675be1d9",
"assets/packages/countries_flag/assets/flags/isle_of_man.svg": "6f379583e431b75cbc724c71ebeb53eb",
"assets/packages/countries_flag/assets/flags/equatorial_guinea.svg": "6a846c7a020498882799cf0722913c37",
"assets/packages/countries_flag/assets/flags/turks_and_caicos.svg": "0cbab0f3ead7a8318fde86e3124c2e50",
"assets/packages/countries_flag/assets/flags/belgium.svg": "4cb4a9f7ac0b5b8b70a6ee2e91881deb",
"assets/packages/countries_flag/assets/flags/northern_marianas_islands.svg": "1f128430ec26fb0eddfd03aa970622bd",
"assets/packages/countries_flag/assets/flags/ecuador.svg": "89cba8a0cb8ddd5571752b71bfa9c3de",
"assets/packages/countries_flag/assets/flags/republic_of_the_congo.svg": "69b486ab68813e9f7c2eacc5bbe59c84",
"assets/packages/countries_flag/assets/flags/republic_of_macedonia.svg": "55d5d50a9d9ac393334099d5e052925d",
"assets/packages/countries_flag/assets/flags/belarus.svg": "9074ee88d2bcccd024461d7202ad8e60",
"assets/packages/countries_flag/assets/flags/netherlands.svg": "cc09c9be0a0230fa5509033583f880c0",
"assets/packages/countries_flag/assets/flags/uganda.svg": "28c018e3104d51ea37cdd4ff8b69f130",
"assets/packages/countries_flag/assets/flags/niue.svg": "1e7662ba0a966887f686cbb537018528",
"assets/packages/countries_flag/assets/flags/gabon.svg": "21875c505e0d17a755708f375d925be6",
"assets/packages/countries_flag/assets/flags/belize.svg": "ac459ded25c2637d01080974ee381704",
"assets/packages/countries_flag/assets/flags/jamaica.svg": "33ceeec1dc1045a51a3c40f82d0a4222",
"assets/packages/countries_flag/assets/flags/denmark.svg": "26b70ac7bd986081eee846e0e37349cb",
"assets/packages/countries_flag/assets/flags/indonesia.svg": "c4ed2ea3039b1642ac6af3393c3ad75c",
"assets/packages/countries_flag/assets/flags/ossetia.svg": "06bea9c64861f5b7f5baf4ebd341d77b",
"assets/packages/countries_flag/assets/flags/estonia.svg": "88dee8a2f1ed299b83a26713e5b347e4",
"assets/packages/countries_flag/assets/flags/cape_verde.svg": "af95ee1c857cedcb143fa612dd0167a5",
"assets/packages/countries_flag/assets/flags/st_vincent_and_the_grenadines.svg": "3d1c263f877a4178d88e7f69923843f4",
"assets/packages/countries_flag/assets/flags/portugal.svg": "160796ce7925931d5e450eb926645650",
"assets/packages/countries_flag/assets/flags/sicily.svg": "707fc76f61c850562e61caa9fa23c1ba",
"assets/packages/countries_flag/assets/flags/sweden.svg": "c404a0e227267fdaefa6ace08710ef2d",
"assets/packages/countries_flag/assets/flags/slovakia.svg": "601ea0d83d5a8cac4b3fbf13a87b22f1",
"assets/packages/countries_flag/assets/flags/puerto_rico.svg": "b4a02cd23f8f6fac1f56424bcf0aec22",
"assets/packages/countries_flag/assets/flags/georgia.svg": "a2f5855d56c0a5d1252938ed5c9ba4e5",
"assets/packages/countries_flag/assets/flags/macao.svg": "3fb6d7ca71da56bba7bba5e88a10f69c",
"assets/packages/countries_flag/assets/flags/bonaire.svg": "01740c9a5e161cf2525e54da82c1ec48",
"assets/packages/countries_flag/assets/flags/suriname.svg": "e967d4ef8a5b3196d87d07e449565e80",
"assets/packages/countries_flag/assets/flags/tunisia.svg": "fd20ddac85c78e43f241ba21b9c7ff15",
"assets/packages/countries_flag/assets/flags/guatemala.svg": "765f0b1027cf7e220e41c372c0674445",
"assets/packages/countries_flag/assets/flags/vietnam.svg": "b305e619cc445b678847006e99f66486",
"assets/packages/countries_flag/assets/flags/mexico.svg": "0923682dd7ae33e9ac03afac5d594d61",
"assets/packages/countries_flag/assets/flags/british_indian_ocean_territory.svg": "69644f1420fa9945abd59874c01cffea",
"assets/packages/countries_flag/assets/flags/tanzania.svg": "0df87c2ace9f88a2d3c56c37105f6d2d",
"assets/packages/countries_flag/assets/flags/east_timor.svg": "41fb0ab81d7867176d5a17bb43ed5acf",
"assets/packages/countries_flag/assets/flags/malta.svg": "8d1c28d755c48e7395c88abbad1126d7",
"assets/packages/countries_flag/assets/flags/nauru.svg": "8a15cde7a137dc436f5131695f95515c",
"assets/packages/countries_flag/assets/flags/libya.svg": "e5eba56f4a35a4828c2dbe0599b91130",
"assets/packages/countries_flag/assets/flags/burkina_faso.svg": "ce5e291549c0926dcb67400b986b992e",
"assets/packages/countries_flag/assets/flags/algeria.svg": "84769831a4fc6d3da00eee9df4a11ffa",
"assets/packages/countries_flag/assets/flags/spain.svg": "e2c32c87e142be109797599bd6721c05",
"assets/packages/countries_flag/assets/flags/russia.svg": "6daead9269a775323da41a5d70bca4ea",
"assets/packages/countries_flag/assets/flags/haiti.svg": "f59d32897f72482483e43f8058f214ec",
"assets/packages/countries_flag/assets/flags/india.svg": "fd159f85fa4f9a5efadf377c90fa3e7e",
"assets/packages/countries_flag/assets/flags/botswana.svg": "dfc9819353594717b6911b56196d964a",
"assets/packages/countries_flag/assets/flags/austria.svg": "7d7c257dd333f62b9ddb68804974a2d9",
"assets/packages/countries_flag/assets/flags/thailand.svg": "60be97300650e57965658b7583af2da9",
"assets/packages/countries_flag/assets/flags/european_union.svg": "b1848db44249c4531215b4739eacd8ad",
"assets/packages/countries_flag/assets/flags/namibia.svg": "c5e6506280deab2cd7fab27ee1205fe4",
"icons/Icon-maskable-192.png": "d1d85edca8e435666aa0e87acfa19cc0",
"icons/Icon-192.png": "2a99d3d03beb03034d85182a4748dcda",
"icons/Icon-512.png": "5e007f25b16051a8c03876db6f93a622",
"icons/Icon-maskable-512.png": "c93ade0693194170dc230a59c6dff0b3"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
