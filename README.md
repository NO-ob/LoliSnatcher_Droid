# LoliSnatcher Droid   [![Github All Releases](https://img.shields.io/github/downloads/NO-ob/LoliSnatcher_Droid/total.svg)](https://github.com/NO-ob/LoliSnatcher_Droid/releases)
[![github-small](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)](https://www.gnu.org/licenses/gpl-3.0)
[![github-small](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/200px-Google_Play_Store_badge_EN.svg.png)](https://play.google.com/store/apps/details?id=com.noaisu.loliSnatcher)


A booru client with support for batch downloading, written in Dart/Flutter for Android but may support more platforms in the future.

Thanks to Showers-U for letting me use their art for an icon check them out on pixiv : https://www.pixiv.net/en/users/28366691

![github-small](https://loli.rehab/images/posts/loliSnatcherDroid/preview.png)


## To Do
- [x] Database
    - [x] Move to android 11+ file storage
    - [x] Plan Database
- [ ] Search remembering
    - [ ] Add setting for remembering tabs
    - [ ] Dump tab searchGlobals to database on search if setting enabled
- [x] Favourites
    - [ ] Add heart icon to thumbnails
    - [x] Add function in booruHandlers to check if fileurl is in favourites
    - [x] Add heart button to image viewer
    - [x] Write/remove data from database when clicked
- [ ] UI Extra
    - [ ] Add buttons for ratings instead of typing it
    - [ ] Add save location functionality
    - [ ] Hamburger menu gesture/ popup on finger hold (kuroba does this)
    - [x] Add option to make thumbs show at normal aspect ratio instead of square
    - [x] Use stream builders when writing image to give a real time progress count (https://www.youtube.com/watch?v=PRd4Y_E2od4)
    - [ ] Themes
- [ ] Bugs
    - [ ] Buttons on about page do not work in android 11
    - [ ] Loading can get locked and ininitely loads in the preview grid





