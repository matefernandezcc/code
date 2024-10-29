       IDENTIFICATION DIVISION.
       PROGRAM-ID. BubbleSort.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUMS.
           05 NUMS-ITEM OCCURS 150 TIMES INDEXED BY IDX.
               10 NUM-PIC PIC 9(4).

       01 TEMP-NUM PIC 9(4).
       01 I PIC 9(4).
       01 J PIC 9(4).
       01 SWAPPED PIC X VALUE 'N'.
       01 NUM-COUNT PIC 9(4) VALUE 150.

       PROCEDURE DIVISION.
           PERFORM INITIALIZE-ARRAY
           PERFORM BUBBLE-SORT
           PERFORM DISPLAY-ARRAY
           STOP RUN.

       INITIALIZE-ARRAY.
           MOVE 698 TO NUMS-ITEM (1)
           MOVE 633 TO NUMS-ITEM (2)
           MOVE 451 TO NUMS-ITEM (3)
           MOVE 587 TO NUMS-ITEM (4)
           MOVE 768 TO NUMS-ITEM (5)
           MOVE 747 TO NUMS-ITEM (6)
           MOVE 284 TO NUMS-ITEM (7)
           MOVE 243 TO NUMS-ITEM (8)
           MOVE 628 TO NUMS-ITEM (9)
           MOVE 772 TO NUMS-ITEM (10)
           MOVE 281 TO NUMS-ITEM (11)
           MOVE 625 TO NUMS-ITEM (12)
           MOVE 265 TO NUMS-ITEM (13)
           MOVE 267 TO NUMS-ITEM (14)
           MOVE 797 TO NUMS-ITEM (15)
           MOVE 697 TO NUMS-ITEM (16)
           MOVE 463 TO NUMS-ITEM (17)
           MOVE 673 TO NUMS-ITEM (18)
           MOVE 245 TO NUMS-ITEM (19)
           MOVE 742 TO NUMS-ITEM (20)
           MOVE 892 TO NUMS-ITEM (21)
           MOVE 451 TO NUMS-ITEM (22)
           MOVE 761 TO NUMS-ITEM (23)
           MOVE 393 TO NUMS-ITEM (24)
           MOVE 797 TO NUMS-ITEM (25)
           MOVE 459 TO NUMS-ITEM (26)
           MOVE 449 TO NUMS-ITEM (27)
           MOVE 692 TO NUMS-ITEM (28)
           MOVE 72 TO NUMS-ITEM (29)
           MOVE 663 TO NUMS-ITEM (30)
           MOVE 121 TO NUMS-ITEM (31)
           MOVE 631 TO NUMS-ITEM (32)
           MOVE 355 TO NUMS-ITEM (33)
           MOVE 672 TO NUMS-ITEM (34)
           MOVE 715 TO NUMS-ITEM (35)
           MOVE 691 TO NUMS-ITEM (36)
           MOVE 874 TO NUMS-ITEM (37)
           MOVE 592 TO NUMS-ITEM (38)
           MOVE 895 TO NUMS-ITEM (39)
           MOVE 871 TO NUMS-ITEM (40)
           MOVE 952 TO NUMS-ITEM (41)
           MOVE 414 TO NUMS-ITEM (42)
           MOVE 128 TO NUMS-ITEM (43)
           MOVE 429 TO NUMS-ITEM (44)
           MOVE 149 TO NUMS-ITEM (45)
           MOVE 418 TO NUMS-ITEM (46)
           MOVE 133 TO NUMS-ITEM (47)
           MOVE 527 TO NUMS-ITEM (48)
           MOVE 771 TO NUMS-ITEM (49)
           MOVE 589 TO NUMS-ITEM (50)
           MOVE 1056 TO NUMS-ITEM (51)
           MOVE 1043 TO NUMS-ITEM (52)
           MOVE 1072 TO NUMS-ITEM (53)
           MOVE 1091 TO NUMS-ITEM (54)
           MOVE 1019 TO NUMS-ITEM (55)
           MOVE 1034 TO NUMS-ITEM (56)
           MOVE 1066 TO NUMS-ITEM (57)
           MOVE 1049 TO NUMS-ITEM (58)
           MOVE 1088 TO NUMS-ITEM (59)
           MOVE 1025 TO NUMS-ITEM (60)
           MOVE 1038 TO NUMS-ITEM (61)
           MOVE 1062 TO NUMS-ITEM (62)
           MOVE 1075 TO NUMS-ITEM (63)
           MOVE 1051 TO NUMS-ITEM (64)
           MOVE 1028 TO NUMS-ITEM (65)
           MOVE 1094 TO NUMS-ITEM (66)
           MOVE 1012 TO NUMS-ITEM (67)
           MOVE 1084 TO NUMS-ITEM (68)
           MOVE 1047 TO NUMS-ITEM (69)
           MOVE 1080 TO NUMS-ITEM (70)
           MOVE 1069 TO NUMS-ITEM (71)
           MOVE 1071 TO NUMS-ITEM (72)
           MOVE 1022 TO NUMS-ITEM (73)
           MOVE 1090 TO NUMS-ITEM (74)
           MOVE 1057 TO NUMS-ITEM (75)
           MOVE 1035 TO NUMS-ITEM (76)
           MOVE 1014 TO NUMS-ITEM (77)
           MOVE 1031 TO NUMS-ITEM (78)
           MOVE 1089 TO NUMS-ITEM (79)
           MOVE 1079 TO NUMS-ITEM (80)
           MOVE 1020 TO NUMS-ITEM (81)
           MOVE 1044 TO NUMS-ITEM (82)
           MOVE 1067 TO NUMS-ITEM (83)
           MOVE 1055 TO NUMS-ITEM (84)
           MOVE 1081 TO NUMS-ITEM (85)
           MOVE 1011 TO NUMS-ITEM (86)
           MOVE 1092 TO NUMS-ITEM (87)
           MOVE 1027 TO NUMS-ITEM (88)
           MOVE 1032 TO NUMS-ITEM (89)
           MOVE 1076 TO NUMS-ITEM (90)
           MOVE 1015 TO NUMS-ITEM (91)
           MOVE 1042 TO NUMS-ITEM (92)
           MOVE 1085 TO NUMS-ITEM (93)
           MOVE 1068 TO NUMS-ITEM (94)
           MOVE 1033 TO NUMS-ITEM (95)
           MOVE 1018 TO NUMS-ITEM (96)
           MOVE 1058 TO NUMS-ITEM (97)
           MOVE 1073 TO NUMS-ITEM (98)
           MOVE 1083 TO NUMS-ITEM (99)
           MOVE 1048 TO NUMS-ITEM (100)
           MOVE 1050 TO NUMS-ITEM (101)
           MOVE 1093 TO NUMS-ITEM (102)
           MOVE 1036 TO NUMS-ITEM (103)
           MOVE 1061 TO NUMS-ITEM (104)
           MOVE 1024 TO NUMS-ITEM (105)
           MOVE 1017 TO NUMS-ITEM (106)
           MOVE 1065 TO NUMS-ITEM (107)
           MOVE 1029 TO NUMS-ITEM (108)
           MOVE 1063 TO NUMS-ITEM (109)
           MOVE 1090 TO NUMS-ITEM (110)
           MOVE 1010 TO NUMS-ITEM (111)
           MOVE 1054 TO NUMS-ITEM (112)
           MOVE 1077 TO NUMS-ITEM (113)
           MOVE 1030 TO NUMS-ITEM (114)
           MOVE 1078 TO NUMS-ITEM (115)
           MOVE 1060 TO NUMS-ITEM (116)
           MOVE 1053 TO NUMS-ITEM (117)
           MOVE 1064 TO NUMS-ITEM (118)
           MOVE 1039 TO NUMS-ITEM (119)
           MOVE 1086 TO NUMS-ITEM (120)
           MOVE 1095 TO NUMS-ITEM (121)
           MOVE 1041 TO NUMS-ITEM (122)
           MOVE 1026 TO NUMS-ITEM (123)
           MOVE 1082 TO NUMS-ITEM (124)
           MOVE 1046 TO NUMS-ITEM (125)
           MOVE 1070 TO NUMS-ITEM (126)
           MOVE 1023 TO NUMS-ITEM (127)
           MOVE 1087 TO NUMS-ITEM (128)
           MOVE 1059 TO NUMS-ITEM (129)
           MOVE 1074 TO NUMS-ITEM (130)
           MOVE 1037 TO NUMS-ITEM (131)
           MOVE 1045 TO NUMS-ITEM (132)
           MOVE 1068 TO NUMS-ITEM (133)
           MOVE 1096 TO NUMS-ITEM (134)
           MOVE 1016 TO NUMS-ITEM (135)
           MOVE 1089 TO NUMS-ITEM (136)
           MOVE 1040 TO NUMS-ITEM (137)
           MOVE 1069 TO NUMS-ITEM (138)
           MOVE 1080 TO NUMS-ITEM (139)
           MOVE 1052 TO NUMS-ITEM (140)
           MOVE 1021 TO NUMS-ITEM (141)
           MOVE 1030 TO NUMS-ITEM (142)
           MOVE 1061 TO NUMS-ITEM (143)
           MOVE 1040 TO NUMS-ITEM (144)
           MOVE 1077 TO NUMS-ITEM (145)
           MOVE 1078 TO NUMS-ITEM (146)
           MOVE 1060 TO NUMS-ITEM (147)
           MOVE 1048 TO NUMS-ITEM (148)
           MOVE 1064 TO NUMS-ITEM (149)
           MOVE 1087 TO NUMS-ITEM (150)
           .

       BUBBLE-SORT.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > NUM-COUNT - 1
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > NUM-COUNT - I
                   IF NUMS-ITEM (J) > NUMS-ITEM (J + 1)
                       MOVE NUMS-ITEM (J) TO TEMP-NUM
                       MOVE NUMS-ITEM (J + 1) TO NUMS-ITEM (J)
                       MOVE TEMP-NUM TO NUMS-ITEM (J + 1)
                       MOVE 'Y' TO SWAPPED
                   END-IF
               END-PERFORM
               IF SWAPPED = 'N'
                   EXIT PERFORM
               END-IF
               MOVE 'N' TO SWAPPED
           END-PERFORM
           .

       DISPLAY-ARRAY.
           PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > NUM-COUNT
               DISPLAY NUMS-ITEM (IDX)
           END-PERFORM
           .
