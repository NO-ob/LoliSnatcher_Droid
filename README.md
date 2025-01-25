# LoliSnatcher Droid   [![Github All Releases](https://img.shields.io/github/downloads/NO-ob/LoliSnatcher_Droid/total.svg)](https://github.com/NO-ob/LoliSnatcher_Droid/releases) [![Discord](https://badgen.net/badge/icon/discord?icon=discord&label)](https://discord.gg/yD47ANdEXW)
[![github-small](https://www.gnu.org/graphics/agplv3-with-text-162x68.png)](https://www.gnu.org/licenses/agpl-3.0.html)
[![github-small](https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Google_Play_Store_badge_EN.svg/200px-Google_Play_Store_badge_EN.svg.png)](https://play.google.com/store/apps/details?id=com.noaisu.play.loliSnatcher)


A booru client with support for batch downloading, written in Dart/Flutter for Android but may support more platforms in the future.

Thanks to Showers-U for letting me use their art for an icon check them out on pixiv : https://www.pixiv.net/en/users/28366691

Supported Booru engines:
- Danbooru
- Gelbooru
- GelbooruV1 (Booru.org)
- Moebooru
- Philomena
- Shimmie
- e621
- Szurubooru
- Hydrus Network
- Sankaku (Default and Idol)
- rule34.xyz / rule34.world
- rule34hentai
- Booru On Rails (Twibooru)
- InkBunny


![github-small](https://github.com/NO-ob/no-ob.github.io/blob/master/images/posts/loliSnatcherDroid/preview.png)

![github-small](https://s1.desu-usergeneratedcontent.xyz/g/image/1616/61/1616619170446.png)

![github-small](https://raw.githubusercontent.com/NO-ob/LoliSnatcher_Droid/master/sancucku.png)


To build the LoliSnatcher_Droid project using CMake, you'll need to follow several steps, especially since some users have reported specific issues with the build process. Here's a general outline of the instructions:

    Clone the repository:
    Start by cloning the repository from GitHub:

    git clone https://github.com/NO-ob/LoliSnatcher_Droid.git
    cd LoliSnatcher_Droid

Install dependencies:

    Ensure you have Flutter and CMake installed. The project is a Flutter-based Android application, so you may also need the Android SDK.
    Additionally, install any necessary plugins or dependencies using:
    

    flutter pub get

Linux-specific builds:
If you're building for Linux, note that there have been issues with missing directories for some Flutter plugins. You may need to regenerate or fix paths in the CMakeLists.txt file by ensuring that plugins like awesome_notifications and url_launcher have the correct paths​


Build the project:

    Run the following command to trigger the CMake build:


    cmake .
    make

Troubleshooting:

    If you encounter issues with missing resources or other errors like CMake Error at flutter/generated_plugins.cmake, make sure the flutter directory is correctly set up with all necessary files. Regenerating the CMake build files can help:

    

        rm -rf build
        cmake .
        make

These steps should guide you in building the project successfully, though you may need to adapt them based on the environment or specific errors you encounter
