#!/bin/bash

# 1С:Предприятие 8.0. БУХ 3.0.

COOKIE="JSESSIONID=1tf7j2v56fdzvp1og744kefm"

HEAD="http://dist.edu.1c.ru/Resource/DL_RES_"
TAIL_1="._1S_Predpriyatie_8.0._BUKh_3.0/Question.xml"
TAIL_10="._1S_Predpriyatie_8.0._BUKh_3/Question.xml"

M_01="A887F674-84E3-4524-918A-5E135DF3831D/Gruppa1/_Vopros___8470_10"
M_02="94AA32E4-5A46-4FAB-960A-A755B488D95D/Gruppa2/_Vopros___8470_20"
M_03="2FA31763-7EBD-4B05-A8D3-24C61027FC29/Gruppa3/_Vopros___8470_30"
M_04_0="2BA5B1AC-B256-4D8D-B1DB-0E4142CF50E1/Gruppa4/_Vopros___8470_40"
M_04_1="2BA5B1AC-B256-4D8D-B1DB-0E4142CF50E1/Gruppa4/_Vopros___8470_4"
M_05="72B969C3-66AC-44C4-A66F-3BDB12741671/Gruppa5/_Vopros___8470_50"
M_06="C74EE562-A312-42F0-8281-40A6B458D97C/Gruppa6/_Vopros___8470_60"
M_07="3C1C2CF4-546F-4FE2-8BC7-22175BAE36A5/Gruppa7/_Vopros___8470_70"
M_08="F2A4B9E7-29F2-416F-9F16-1604178EB7D5/Gruppa8/_Vopros___8470_80"
M_09="3493AE5D-1BBC-4F6D-B17D-D6894CAA86AA/Gruppa9/_Vopros___8470_90"
M_10="63F313AE-93B4-4B27-8B48-565810F1CF4D/Gruppa10/_Vopros___8470_100"
M_11="2E1B890C-3F1A-454D-A7A8-88CD258DD30A/Gruppa11/_Vopros___8470_110"
M_12="2E62688D-A67F-49E2-92A4-7831A4667C52/Gruppa12/_Vopros___8470_120"
M_13="26B2DDA9-13F4-4C2B-859A-5A9BC5E646BD/Gruppa13/_Vopros___8470_130"
M_14="3560F37F-FBC8-4B4E-8D45-016AA9FC1DC4/Gruppa14/_Vopros___8470_140"

# # module 01 (37)
# for i in {1..37}; do
# curl -o "./xml-files/buh/module1/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_01`printf "%02d" $i`$TAIL_1"
# done
#
# # module 02 (28)
# for i in {1..28}; do
# curl -o "./xml-files/buh/module2/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_02`printf "%02d" $i`$TAIL_1"
# done
#
# # module 03 (30)
# for i in {1..30}; do
# curl -o "./xml-files/buh/module3/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_03`printf "%02d" $i`$TAIL_1"
# done
#
# # module 04 - 0  (1 - 99)
# for i in {1..99}; do
# curl -o "./xml-files/buh/module4/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_04_0`printf "%02d" $i`$TAIL_1"
# done
#
# # module 04 - 1 (100 - 112)
# for i in {100..112}; do
# curl -o "./xml-files/buh/module4/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_04_1`printf "%02d" $i`$TAIL_1"
# done
#
# # module 05 (45)
# for i in {1..45}; do
# curl -o "./xml-files/buh/module5/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_05`printf "%02d" $i`$TAIL_1"
# done
#
# # module 06 (75)
# for i in {1..75}; do
# curl -o "./xml-files/buh/module6/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_06`printf "%02d" $i`$TAIL_1"
# done

# # module 07 (94)
# for i in {1..94}; do
# curl -o "./xml-files/buh/module7/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_07`printf "%02d" $i`$TAIL_1"
# done
#
# # module 08 (44)
# for i in {1..44}; do
# curl -o "./xml-files/buh/module8/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_08`printf "%02d" $i`$TAIL_1"
# done
#
# # module 09 (91)
# for i in {1..91}; do
# curl -o "./xml-files/buh/module9/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_09`printf "%02d" $i`$TAIL_1"
# done
#
# # module 10 (43)
# for i in {1..43}; do
# curl -o "./xml-files/buh/module10/buh.q.`printf "%02d" $i`.xml" \
#  --cookie $COOKIE "$HEAD$M_10`printf "%02d" $i`$TAIL_10"
# done
#
# # module 11 (70)
# for i in {1..70}; do
# curl -o "./xml-files/buh/module11/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_11`printf "%02d" $i`$TAIL_10"
# done
#
# # module 12 (56)
# for i in {1..56}; do
# curl -o "./xml-files/buh/module12/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_12`printf "%02d" $i`$TAIL_10"
# done
#
# # module 13 (48)
# for i in {1..48}; do
# curl -o "./xml-files/buh/module13/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_13`printf "%02d" $i`$TAIL_10"
# done

# # module 14 (48)
# for i in {1..48}; do
# curl -o "./xml-files/buh/module14/buh.q.`printf "%02d" $i`.xml" \
#   --cookie $COOKIE "$HEAD$M_14`printf "%02d" $i`$TAIL_10"
# done
