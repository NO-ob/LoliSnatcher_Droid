# LoliSnatcher Droid
[![github-small](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)](https://www.gnu.org/licenses/gpl-3.0)
[![github-small](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/200px-Google_Play_Store_badge_EN.svg.png)](https://play.google.com/store/apps/details?id=com.noaisu.loliSnatcher)


A booru client with support for batch downloading, written in Dart/Flutter for Android but may support more platforms in the future.

Thanks to Showers-U for letting me use their art for an icon check them out on pixiv : https://www.pixiv.net/en/users/28366691

![github-small](https://github.com/NO-ob/LoliSnatcher_Droid/blob/b6ed6795951895c7ec8ddae68697f6dd50653c02/demo.gif)


## To Do
- [x] Search and retrieve data from gelbooru
- [x] View image previews
- [x] Load new image previews on scroll
- [x] View full sized image in an intent
- [x] Add Open in browser button to gallery
- [x] Batch download Images from gelbooru
- [x] Add support for danbooru
- [x] Add settings
    - [x] Amount of images to fetch in one go
    - [x] More boorus
    - [x] Timeout between Snatching
    - [x] Default Tags
    - [ ] Custom File Names
- [x] Tidy UI
    - [x] Drawer
    - [x] Add Tablet / Widescreen mode (Drawer always open, no top bar)
    - [x] Settings and Snatcher Pages
- [ ] More Booru
    - [x] Shimmie - https://rule34.paheal.net/
    - [x] Philomena - https://derpibooru.org/
    - [x] Szurubooru
    - [ ] Danbooru Gold links - https://github.com/friendlyanon/decensooru/tree/master/batches
- [x] Tags
    - [x] View Tags in popup
    - [x] Add a tag to current search
    - [x] Add a tag to new search
- [ ] UI Extra
    - [x] Add Tabs/ Multiple Different Searches
    - [ ] Add buttons for ratings instead of typing it
    - [ ] Add save location functionality
    - [x] Make new boorus show without restarting
    - [ ] Make more images load when reaching end of scrolling in full view
    - [ ] Hamburger menu gesture/ popup on finger hold (kuroba does this)
- [ ] Favourites
    - [ ] Add favourites storing
    - [ ] Implement importing from animeboxes
- [ ] Bugs
    - [x] Zoomed image breaks scrolling in full view (I think this only happens when the next image is not loaded so preloading may fix it)
    - [ ] Device doesn't vibrate when moving cursor
    - [ ] previous and last image can overlap each other
    - [ ] zooming in can crash the app
    - [ ] pressing save twice creates 2 copies of the same booru
    - [ ] no way to delete boorus, apparently


