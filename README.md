# LoliSnatcher Droid   [![Github All Releases](https://img.shields.io/github/downloads/NO-ob/LoliSnatcher_Droid/total.svg)](https://github.com/NO-ob/LoliSnatcher_Droid/releases)
[![github-small](https://www.gnu.org/graphics/gplv3-with-text-136x68.png)](https://www.gnu.org/licenses/gpl-3.0)
[![github-small](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/200px-Google_Play_Store_badge_EN.svg.png)](https://play.google.com/store/apps/details?id=com.noaisu.loliSnatcher)


A booru client with support for batch downloading, written in Dart/Flutter for Android but may support more platforms in the future.

Thanks to Showers-U for letting me use their art for an icon check them out on pixiv : https://www.pixiv.net/en/users/28366691

![github-small](https://loli.rehab/images/posts/loliSnatcherDroid/preview.png)


## To Do
- [ ] Database
    - [ ] Move to android 11+ file storage
    - [ ] Plan Database
    - [ ] Migrate settings to database
    - [ ] Migrate booruconfigs to database
    - [ ] Make app build a database with default settings on first launch after getting write perms
- [ ] Search remembering
    - [ ] Add setting for remembering tabs
    - [ ] Dump tab searchGlobals to database on search if setting enabled
- [ ] Favourites
    - [ ] Add heart icon to thumbnails
    - [ ] Add function in booruHandlers to check if fileurl is in favourites
    - [ ] Add heart button to image viewer
    - [ ] Write/remove data from database when clicked
- [ ] UI Extra
    - [ ] Add buttons for ratings instead of typing it
    - [ ] Add save location functionality
    - [ ] Hamburger menu gesture/ popup on finger hold (kuroba does this)
    - [x] Use stream builders when writing image to give a real time progress count (https://www.youtube.com/watch?v=PRd4Y_E2od4)
- [ ] Bugs
    - [ ] previous and last image can overlap each other
    - [ ] Hydrus video support




