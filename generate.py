import requests, json, random
from time import time, ctime
t = time()

print(ctime(t))

link = 'https://github.com/ronnapatp/'

f = open("./README.md", "w")
res = requests.get(f'https://api.github.com/users/ronnapatp')
result = json.loads(res.text)
f.write(f'''
Profile will auto update every 30 minutes with https://github.com/ronnapatp/ronnapatp 😇

# 👋🏻 Hey, I'm ronnඞpඞtp

<details><summary><strong>My Profile</strong></summary>

## Profile

- I have {result['followers']} followers.
- I follow {result['following']} people.

</details>

<details><summary><strong>State</strong></summary>

## State

[![wakatime](https://wakatime.com/badge/user/b083581b-d8a5-4ab4-a887-a768e082ff97.svg)](https://wakatime.com/@b083581b-d8a5-4ab4-a887-a768e082ff97)

[![Languages](https://github-readme-stats.vercel.app/api/top-langs/?username=ronnapatp&layout=compact&langs_count=10&hide_border=true&custom_title=Languages&bg_color=00000000)](https://github.com/ronnapatp)

</details>

<details><summary><strong>Active Project</strong></summary>

## Active Project

- [ronnapat.com]({link}ronnapat.com)
- [Diswitch](https://github.com/theronnapat/diswitch)
- [Garden]({link}garden)
- [Twitter bot]({link}twitter-bot)
- [Autogacha]({link}autogacha)
- [Profile updater]({link}ronnapatp)
- [Kumi The Chubby Bear](https://github.com/kumithechubbybear)

</details>

[![](https://img.shields.io/badge/website-000000?style=for-the-badge&logo=About.me&logoColor=white)](https://ronnapat.com/)

Latest update : {ctime(t)}
''')
f.close()
