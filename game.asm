_copy_string:
    mov al, [esi]
    mov [edi], al
    test al, al
    jz .done
    inc esi
    inc edi
    jmp _copy_string
.done:
    ret

_compare_strings:
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov esi, [ebp+8]
    mov edi, [ebp+12]
.compare_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne .not_equal
    test al, al
    jz .equal
    inc esi
    inc edi
    jmp .compare_loop
.equal:
    xor eax, eax
    jmp .done
.not_equal:
    mov eax, 1
.done:
    pop edi
    pop esi
    pop ebp
    ret

_clearscreen:
    push ebp
    mov ebp, esp
    push cmd_500
    call _system
    add esp, 4
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret

_autocollectresources:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp+8]
    mov dword [var_autocollect], eax
    mov eax, dword [ebp+12]
    mov dword [var_multiplier], eax
    mov eax, dword [ebp+16]
    mov dword [var_basecollect], eax
    mov eax, dword [ebp+20]
    mov dword [var_prestigebonus], eax
    mov eax, dword [ebp+24]
    mov dword [var_wood], eax
    mov eax, dword [ebp+28]
    mov dword [var_stone], eax
    mov eax, dword [ebp+32]
    mov dword [var_gold], eax
    mov eax, dword [ebp+36]
    mov dword [var_totalcollect], eax
    mov eax, dword [ebp+40]
    mov dword [var_lumbermill], eax
    mov eax, dword [ebp+44]
    mov dword [var_quarry], eax
    mov eax, dword [ebp+48]
    mov dword [var_goldmine], eax
    mov eax, dword [ebp+52]
    mov dword [var_warehouse], eax
    mov eax, dword [var_autocollect]
    push eax
    mov eax, dword [var_multiplier]
    pop ebx
    imul ebx, dword [var_multiplier]
    mov eax, ebx
    mov dword [var_basecollect], eax
    mov eax, 0
    mov dword [var_buildingbonus], eax
    mov eax, dword [var_buildingbonus]
    push eax
    mov eax, dword [var_lumbermill]
    pop ebx
    add ebx, dword [var_lumbermill]
    mov eax, ebx
    mov dword [var_buildingbonus], eax
    mov eax, dword [var_buildingbonus]
    push eax
    mov eax, dword [var_quarry]
    pop ebx
    add ebx, dword [var_quarry]
    mov eax, ebx
    mov dword [var_buildingbonus], eax
    mov eax, dword [var_buildingbonus]
    push eax
    mov eax, dword [var_goldmine]
    pop ebx
    add ebx, dword [var_goldmine]
    mov eax, ebx
    mov dword [var_buildingbonus], eax
    mov eax, dword [var_basecollect]
    push eax
    mov eax, dword [var_buildingbonus]
    pop ebx
    add ebx, dword [var_buildingbonus]
    mov eax, ebx
    mov dword [var_basecollect], eax
    mov eax, dword [var_warehouse]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_372
    jmp if_else_372
if_then_372:
    mov eax, dword [var_basecollect]
    push eax
    mov eax, dword [var_warehouse]
    pop ebx
    imul ebx, dword [var_warehouse]
    mov eax, ebx
    mov dword [var_warehousebonus], eax
    mov eax, dword [var_warehousebonus]
    push eax
    mov eax, 10
    pop ebx
    mov eax, ebx
    mov ebx, eax
    mov eax, ebx
    mov ebx, 10
    cdq
    idiv ebx
    mov dword [var_warehousebonus], eax
    mov eax, dword [var_basecollect]
    push eax
    mov eax, dword [var_warehousebonus]
    pop ebx
    add ebx, dword [var_warehousebonus]
    mov eax, ebx
    mov dword [var_basecollect], eax
    jmp if_end_372
if_else_372:
if_end_372:
    mov eax, dword [var_basecollect]
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_totalcollect], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_totalcollect]
    pop ebx
    add ebx, dword [var_totalcollect]
    mov eax, ebx
    push eax
    mov eax, dword [var_lumbermill]
    pop ebx
    add ebx, dword [var_lumbermill]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_totalcollect]
    pop ebx
    add ebx, dword [var_totalcollect]
    mov eax, ebx
    push eax
    mov eax, dword [var_quarry]
    pop ebx
    add ebx, dword [var_quarry]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_totalcollect]
    pop ebx
    add ebx, dword [var_totalcollect]
    mov eax, ebx
    push eax
    mov eax, dword [var_goldmine]
    pop ebx
    add ebx, dword [var_goldmine]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_wood]
    mov esp, ebp
    pop ebp
    ret

_showstats:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp+8]
    mov dword [var_turn], eax
    mov eax, dword [ebp+12]
    mov dword [var_wood], eax
    mov eax, dword [ebp+16]
    mov dword [var_stone], eax
    mov eax, dword [ebp+20]
    mov dword [var_gold], eax
    mov eax, dword [ebp+24]
    mov dword [var_level], eax
    mov eax, dword [ebp+28]
    mov dword [var_autocollect], eax
    mov eax, dword [ebp+32]
    mov dword [var_multiplier], eax
    mov eax, dword [ebp+36]
    mov dword [var_prestigelevel], eax
    mov eax, dword [ebp+40]
    mov dword [var_prestigebonus], eax
    mov eax, dword [ebp+44]
    mov dword [var_achievements], eax
    push dword [var_turn]
    push str_501
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_wood]
    push str_71
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_stone]
    push str_72
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_gold]
    push str_73
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_level]
    push str_74
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_autocollect]
    push str_502
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_multiplier]
    push str_85
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_prestigebonus]
    push dword [var_prestigelevel]
    push str_503
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_achievements]
    push str_86
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret

_spawnboss:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp+8]
    mov dword [var_bossalive], eax
    mov eax, dword [ebp+12]
    mov dword [var_bosshp], eax
    mov eax, dword [ebp+16]
    mov dword [var_level], eax
    mov eax, 1
    mov dword [var_bossalive], eax
    mov eax, 20
    push eax
    mov eax, dword [var_level]
    pop ebx
    imul ebx, dword [var_level]
    mov eax, ebx
    mov dword [var_bosshp], eax
    push str_504
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret

_boop:
    push ebp
    mov ebp, esp
    mov eax, dword [ebp+8]
    mov dword [var_freq], eax
    push dword [var_freq]
    push 700
    call _Beep@8
    add esp, 8
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret

extern _Beep@8

extern _GetProcAddress@8

extern _LoadLibraryA@4

extern _Sleep@4

extern _printf

extern _scanf

extern _system

extern _time

section .data
str_0 db "Resource Simulator", 0
str_1 db "Start game?", 0
dll_hnd_user32_dll db "user32.dll", 0
func_MessageBoxA db "MessageBoxA", 0
str_2 db "=== RESOURCE COLLECTOR GAME ===", 0
str_3 db 10, 0
str_4 db "Commands: 1=collect, 2=upgrade, 3=status, 4=shop, 5=achievements, 6=minigames, 7=daily reward, 8=boss fight, 9=marketplace, 10=exit ", 0
str_5 db "Lucky event! Auto collect doubled this turn.", 0
str_6 db "=== LUCKY: Achievement unlocked! ===", 0
str_7 db "Forest discovery! Found %d wood.", 0
str_8 db "Quarry discovery! Found %d stone.", 0
str_9 db "Gold vein discovered! Found %d gold.", 0
str_10 db "Market boom! All resources doubled this turn.", 0
str_11 db "Enter command: ", 0
scanf_fmt_12 db "%d", 0
str_13 db "=== 1337 H4X0R M0D3 4CT1V4T3D! ===", 0
str_14 db "L33T skills detected! +337 of each resource!", 0
str_15 db "=== THE ANSWER TO LIFE, THE UNIVERSE, AND EVERYTHING! ===", 0
str_16 db "You found the meaning of life! Resources multiplied!", 0
str_17 db "=== JACKPOT! ===", 0
str_18 db "Lucky number 777! Instant level up and +77 resources!", 0
str_19 db "=== EMERGENCY RESOURCES DEPLOYED! ===", 0
str_20 db "Help is on the way! +911 resources incoming!", 0
str_21 db "=== SEQUENCE RECOGNIZED! ===", 0
str_22 db "Simple but effective! +1234 wood!", 0
str_23 db "=== BRITISH EMERGENCY! ===", 0
str_24 db "Help requested! +999 stone for sturdy structures!", 0
str_25 db "=== PI POWER! ===", 0
str_26 db "Infinite resources? Almost! +314 of everything!", 0
str_27 db "=== RESOURCE NOT FOUND ===", 0
str_28 db "Just kidding! Found hidden cache! +404 gold!", 0
str_29 db "=== IMMATURE BUT REWARDING! ===", 0
str_30 db "Heh. You know what this means. +800 resources!", 0
str_31 db "=== THAT'S THE SAME COMBINATION AS MY LUGGAGE! ===", 0
str_32 db "Spaceballs reference! +12345 total resources split evenly!", 0
str_33 db "=== PRISONER 24601! ===", 0
str_34 db "Jean Valjean would be proud! Prestige cost reduced!", 0
str_35 db "=== JENNY, I GOT YOUR NUMBER! ===", 0
str_36 db "For a good time, collect +867 resources!", 0
str_37 db "=== DECLARATION OF INDEPENDENCE! ===", 0
str_38 db "Freedom from resource scarcity! +1776 of everything!", 0
str_39 db "=== BIG BROTHER IS WATCHING ===", 0
str_40 db "Doublethink activated! Resources are both there and not there!", 0
str_41 db "=== OPEN THE POD BAY DOORS, HAL ===", 0
str_42 db "I'm sorry Dave, I'm afraid I can do that... just kidding! +2001 resources!", 0
str_43 db "=== THE TEMPLES OF SYRINX ===", 0
str_44 db "We've taken care of everything! +2112 resources!", 0
str_45 db "=== NEW WORLD DISCOVERED! ===", 0
str_46 db "You discovered new resources! +1492 of each!", 0
str_47 db "=== NORMAN CONQUEST! ===", 0
str_48 db "William the Conqueror approves! +1066 resources!", 0
str_49 db "=== NICE! ===", 0
str_50 db "Nice. +69 of everything!", 0
str_51 db "=== So wrong, resetting all ===", 0
str_52 db "=== BLAZE IT ===", 0
str_53 db "Smoke 'em if you got 'em! +420 resources!", 0
str_54 db "Nice. +67 of everything!", 0
str_55 db "Collecting resources...", 0
str_56 db "You collected %d wood.", 0
str_57 db "You collected %d stone.", 0
str_58 db "You collected %d gold.", 0
str_59 db "=== ACHIEVEMENT UNLOCKED: First Steps! ===", 0
str_60 db "Upgrading...", 0
str_61 db "Upgrade successful!", 0
str_62 db "=== ACHIEVEMENT UNLOCKED: Halfway There! (Level 5) ===", 0
str_63 db "=== ACHIEVEMENT UNLOCKED: Master Collector! (Level 10) ===", 0
str_64 db "=== ACHIEVEMENT UNLOCKED: Grand Master! (Level 20) ===", 0
str_65 db "=== ACHIEVEMENT UNLOCKED: Legendary Collector! (Level 50) ===", 0
str_66 db "=== ACHIEVEMENT UNLOCKED: Shopaholic! (Level 3+) ===", 0
str_67 db "=== ACHIEVEMENT UNLOCKED: Speedrunner! (Level 5 in <20 turns) ===", 0
str_68 db "Not enough resources for upgrade!", 0
str_69 db "Need Wood: %d, Stone: %d, Gold: %d", 0
str_70 db "=== STATUS ===", 0
str_71 db "Wood: %d", 0
str_72 db "Stone: %d", 0
str_73 db "Gold: %d", 0
str_74 db "Level: %d", 0
str_75 db "Auto Collect: %d", 0
str_76 db "Upgrade Cost: %d", 0
str_77 db "Prestige Level: %d", 0
str_78 db "Prestige Bonus: x%d", 0
str_79 db "Next Prestige Cost: %d total resources", 0
str_80 db "Lumber Mills: %d (+%d wood/turn)", 0
str_81 db "Quarries: %d (+%d stone/turn)", 0
str_82 db "Gold Mines: %d (+%d gold/turn)", 0
str_83 db "Warehouses: %d (+%d%% collection)", 0
str_84 db "Next Upgrade Needs: Wood %d, Stone %d, Gold %d", 0
str_85 db "Multiplier: %d", 0
str_86 db "Achievements: %d/35", 0
str_87 db "=== RESOURCE SHOP ===", 0
str_88 db "Your Resources:", 0
str_89 db "Wood: %d | Stone: %d | Gold: %d", 0
str_90 db "Buildings:", 0
str_91 db "========================", 0
str_92 db "1: Multiplier Boost (+1) - %d Gold", 0
str_93 db "2: Wood Cutter - %d Stone, %d Gold", 0
str_94 db "3: Stone Mason - %d Wood, %d Gold", 0
str_95 db "--- BUILDINGS ---", 0
str_96 db "4: Lumber Mill (+1 wood/turn)", 0
str_97 db "   Cost: %d Wood, %d Stone", 0
str_98 db "5: Stone Quarry (+1 stone/turn)", 0
str_99 db "6: Gold Mine (+1 gold/turn)", 0
str_100 db "7: Warehouse (+10%% collection rate)", 0
str_101 db "   Cost: %d of each resource", 0
str_102 db "--- PRESTIGE ---", 0
str_103 db "8: Prestige (Reset for x2 bonus)", 0
str_104 db "   Cost: %d total resources", 0
str_105 db "   Current: %d/%d", 0
str_106 db "9: Exit Shop", 0
str_107 db "Enter choice (1-9): ", 0
scanf_fmt_108 db "%d", 0
str_109 db "Multiplier boosted to %d!", 0
str_110 db "Not enough gold! Need %d", 0
str_111 db "Wood Cutter hired! +%d wood", 0
str_112 db "Need %d gold!", 0
str_113 db "Need %d stone!", 0
str_114 db "Stone Mason hired! +%d stone", 0
str_115 db "Need %d wood!", 0
str_116 db "Lumber Mill built! (+1 wood/turn)", 0
str_117 db "Total Lumber Mills: %d", 0
str_118 db "Stone Quarry built! (+1 stone/turn)", 0
str_119 db "Total Quarries: %d", 0
str_120 db "Gold Mine built! (+1 gold/turn)", 0
str_121 db "Total Gold Mines: %d", 0
str_122 db "Warehouse built! (+10%% collection rate)", 0
str_123 db "Total Warehouses: %d (+%d%%)", 0
str_124 db "PRESTIGE ACHIEVED! Level %d", 0
str_125 db "All resources converted to x%d bonus!", 0
str_126 db "Need %d total resources (have %d)", 0
str_127 db "Leaving shop...", 0
str_128 db "=== ACHIEVEMENTS (%d/35) ===", 0
str_129 db "[X] First Steps - Collect your first resource", 0
str_130 db "[ ] First Steps - Collect your first resource", 0
str_131 db "[X] Halfway There - Reach Level 5", 0
str_132 db "[ ] Halfway There - Reach Level 5", 0
str_133 db "[X] Master Collector - Reach Level 10", 0
str_134 db "[ ] Master Collector - Reach Level 10", 0
str_135 db "[X] Grand Master - Reach Level 20", 0
str_136 db "[ ] Grand Master - Reach Level 20", 0
str_137 db "[X] Legendary Collector - Reach Level 50", 0
str_138 db "[ ] Legendary Collector - Reach Level 50", 0
str_139 db "[X] Resource Baron - Collect 100+ total resources", 0
str_140 db "[ ] Resource Baron - Collect 100+ total resources", 0
str_141 db "[X] Wealthy Magnate - Collect 1,000+ total resources", 0
str_142 db "[ ] Wealthy Magnate - Collect 1,000+ total resources", 0
str_143 db "[X] Resource Millionaire - Collect 10,000+ total resources", 0
str_144 db "[ ] Resource Millionaire - Collect 10,000+ total resources", 0
str_145 db "[X] Lumberjack - Collect 50+ wood", 0
str_146 db "[ ] Lumberjack - Collect 50+ wood", 0
str_147 db "[X] Quarry King - Collect 50+ stone", 0
str_148 db "[ ] Quarry King - Collect 50+ stone", 0
str_149 db "[X] Gold Digger - Collect 50+ gold", 0
str_150 db "[ ] Gold Digger - Collect 50+ gold", 0
str_151 db "[X] Wood Tycoon - Collect 500+ wood", 0
str_152 db "[ ] Wood Tycoon - Collect 500+ wood", 0
str_153 db "[X] Stone Tycoon - Collect 500+ stone", 0
str_154 db "[ ] Stone Tycoon - Collect 500+ stone", 0
str_155 db "[X] Gold Tycoon - Collect 500+ gold", 0
str_156 db "[ ] Gold Tycoon - Collect 500+ gold", 0
str_157 db "[X] Speedrunner - Reach Level 5 in under 20 turns", 0
str_158 db "[ ] Speedrunner - Reach Level 5 in under 20 turns", 0
str_159 db "[X] Shopaholic - Reach Level 3", 0
str_160 db "[ ] Shopaholic - Reach Level 3", 0
str_161 db "[X] Minigame Master - Win 10 minigames", 0
str_162 db "[ ] Minigame Master - Win 10 minigames", 0
str_163 db "[X] Event Explorer - Experience 20 random events", 0
str_164 db "[ ] Event Explorer - Experience 20 random events", 0
str_165 db "[X] Turn Veteran - Play 100 turns", 0
str_166 db "[ ] Turn Veteran - Play 100 turns", 0
str_167 db "[X] Collector Addict - Make 200 collections", 0
str_168 db "[ ] Collector Addict - Make 200 collections", 0
str_169 db "[X] Iron Fist - Reach Level 100", 0
str_170 db "[ ] Iron Fist - Reach Level 100", 0
str_171 db "[X] Collector Pro - Make 500 collections", 0
str_172 db "[ ] Collector Pro - Make 500 collections", 0
str_173 db "[X] Ultra Rich - Collect 100,000+ total resources", 0
str_174 db "[ ] Ultra Rich - Collect 100,000+ total resources", 0
str_175 db "[X] Grinder - Play 500 turns", 0
str_176 db "[ ] Grinder - Play 500 turns", 0
str_177 db "[X] Hoarder - Reach 5,000 of any resource", 0
str_178 db "[ ] Hoarder - Reach 5,000 of any resource", 0
str_179 db "[X] Unstoppable - Win 25 minigames", 0
str_180 db "[ ] Unstoppable - Win 25 minigames", 0
str_181 db "[X] Event Legend - Experience 100 random events", 0
str_182 db "[ ] Event Legend - Experience 100 random events", 0
str_183 db "[X] Jackpot - Win 15 minigames", 0
str_184 db "[ ] Jackpot - Win 15 minigames", 0
str_185 db "[X] Dedicated - Play 1,000 turns", 0
str_186 db "[ ] Dedicated - Play 1,000 turns", 0
str_187 db "[X] Maxed Out - Reach Level 200", 0
str_188 db "[ ] Maxed Out - Reach Level 200", 0
str_189 db "[X] Trader - Make 10 market trades", 0
str_190 db "[ ] Trader - Make 10 market trades", 0
str_191 db "[X] Speculator - Make 5 market bets", 0
str_192 db "[ ] Speculator - Make 5 market bets", 0
str_193 db "[X] Market Tycoon - Make 50 market trades", 0
str_194 db "[ ] Market Tycoon - Make 50 market trades", 0
str_195 db "[X] Lucky - Find a rare event", 0
str_196 db "[ ] Lucky - Find a rare event", 0
str_197 db "[X] Master Builder - Build 5 buildings", 0
str_198 db "[ ] Master Builder - Build 5 buildings", 0
str_199 db "=== MINIGAME ARCADE ===", 0
str_200 db "Choose a minigame:", 0
str_201 db "1: Guess the Number (1-5)", 0
str_202 db "2: Card Guessing (Higher/Lower)", 0
str_203 db "3: Math Quiz", 0
str_204 db "4: Rock Paper Scissors", 0
str_205 db "5: Dice Duel", 0
str_206 db "6: Coin Flip", 0
str_207 db "7: Higher Or Lower", 0
str_208 db "8: Resource Slots", 0
str_209 db "Enter choice (1-6): ", 0
scanf_fmt_210 db "%d", 0
str_211 db "=== GUESS THE NUMBER MINIGAME ===", 0
str_212 db "Guess a number between 1 and 5!", 0
str_213 db "Win big rewards if you guess correctly!", 0
str_214 db "Enter your guess (1-5): ", 0
scanf_fmt_215 db "%d", 0
str_216 db "Congratulations! You guessed it!", 0
str_217 db "You won %d of each resource!", 0
str_218 db "Wrong! The number was %d", 0
str_219 db "Better luck next time!", 0
str_220 db "=== CARD GUESSING GAME ===", 0
str_221 db "Guess if the next card is HIGHER or LOWER!", 0
str_222 db "Win streak increases rewards!", 0
str_223 db "Cards are numbered 1-13", 0
str_224 db "First card: %d", 0
str_225 db "Round %d of 5", 0
str_226 db "Current streak: %d", 0
str_227 db "Current card: %d", 0
str_228 db "Guess next card:", 0
str_229 db "1 = HIGHER", 0
str_230 db " 2 = LOWER", 0
str_231 db "Enter choice: ", 0
scanf_fmt_232 db "%d", 0
str_233 db "Next card: %d", 0
str_234 db "Same card! No change to streak.", 0
str_235 db "Correct! Streak: %d", 0
str_236 db "Wrong! Streak broken.", 0
str_237 db "Continue to next round?", 0
str_238 db "1 = YES", 0
str_239 db " 2 = NO (Cash out now)", 0
scanf_fmt_240 db "%d", 0
str_241 db "=== CARD GAME RESULTS ===", 0
str_242 db "Maximum Streak: %d", 0
str_243 db "Reward Multiplier: x%d", 0
str_244 db "No winning streaks this game.", 0
str_245 db "Try again for better luck!", 0
str_246 db "=== MATH QUIZ CHALLENGE ===", 0
str_247 db "Solve math problems for bonuses!", 0
str_248 db "Difficulty increases with your level!", 0
str_249 db "--- Question %d of %d ---", 0
str_250 db "What is %d + %d?", 0
str_251 db "What is %d - %d?", 0
str_252 db "What is %d * %d?", 0
str_253 db "What is %d / %d?", 0
str_254 db "Enter your answer: ", 0
scanf_fmt_255 db "%d", 0
str_256 db "Correct! +1 point", 0
str_257 db "Wrong! The answer was %d", 0
str_258 db "Quiz Complete! Score: %d/%d", 0
str_259 db "Quiz Complete! Score: 0/%d", 0
str_260 db "Study up and try again!", 0
str_261 db "=== ROCK PAPER SCISSORS ===", 0
str_262 db "Best of 3 rounds!", 0
str_263 db "1 = ROCK (beats scissors)", 0
str_264 db " 2 = PAPER (beats rock)", 0
str_265 db " 3 = SCISSORS (beats paper)", 0
str_266 db "Win all 3 rounds for maximum reward!", 0
str_267 db "===========================", 0
str_268 db "--- Round %d ---", 0
str_269 db "Choose: 1=Rock, 2=Paper, 3=Scissors", 0
str_270 db "Your choice: ", 0
scanf_fmt_271 db "%d", 0
str_272 db "You chose: ", 0
str_273 db "ROCK", 0
str_274 db "PAPER", 0
str_275 db "SCISSORS", 0
str_276 db "Bot chose: ", 0
str_277 db "It's a TIE!", 0
str_278 db "Replaying round...", 0
str_279 db "You WIN this round!", 0
str_280 db "Bot WINS this round!", 0
str_281 db "Score: You %d - %d Bot", 0
str_282 db "=== ROCK PAPER SCISSORS RESULTS ===", 0
str_283 db "Final Score: You %d - %d Bot", 0
str_284 db "PERFECT VICTORY! 3-0 SWEEP!", 0
str_285 db "JACKPOT! You won %d of each resource!", 0
str_286 db "VICTORY! You beat the bot!", 0
str_287 db "Close match! You won!", 0
str_288 db "DRAW! No winner this time.", 0
str_289 db "Consolation prize: %d of each resource", 0
str_290 db "DEFEAT! The bot was too strong!", 0
str_291 db "Participation reward: %d of each resource", 0
str_292 db "=== DICE DUEL ===", 0
str_293 db "Roll dice against the computer!", 0
str_294 db " Higher total wins. Doubles = 2x reward!", 0
str_295 db "Enter bet amount (minimum 10): ", 0
scanf_fmt_296 db "%d", 0
str_297 db "Rolling your dice...", 0
str_298 db "You rolled: %d and %d = %d", 0
str_299 db "Computer rolling...", 0
str_300 db "Computer: %d and %d = %d", 0
str_301 db "DOUBLES! Your roll is special!", 0
str_302 db "Computer got DOUBLES!", 0
str_303 db "DOUBLES BONUS! Reward doubled again!", 0
str_304 db "=== YOU WIN! ===", 0
str_305 db "Won %d of each resource!", 0
str_306 db "=== IT'S A TIE! ===", 0
str_307 db "No winner, no loser. Bet returned.", 0
str_308 db "=== COMPUTER WINS! ===", 0
str_309 db "Computer doubles! You lose double!", 0
str_310 db "Lost %d of each resource.", 0
str_311 db "Not enough resources for that bet!", 0
str_312 db "Need at least %d of each resource.", 0
str_313 db "=== COIN FLIP ===", 0
str_314 db "Heads or Tails? Double or nothing!", 0
str_315 db "Enter bet amount: ", 0
scanf_fmt_316 db "%d", 0
str_317 db "1. Heads", 0
str_318 db "2. Tails", 0
str_319 db "Choose: ", 0
scanf_fmt_320 db "%d", 0
str_321 db "Coin: HEADS!", 0
str_322 db "Coin: TAILS!", 0
str_323 db "You WIN %d resources!", 0
str_324 db "You LOSE the bet.", 0
str_325 db "=== HIGHER OR LOWER ===", 0
str_326 db "Is next number higher or lower?", 0
str_327 db "Starting number: %d", 0
str_328 db "Current: %d", 0
str_329 db "1. Higher", 0
str_330 db "2. Lower", 0
str_331 db "Guess: ", 0
scanf_fmt_332 db "%d", 0
str_333 db "Next number: %d", 0
str_334 db "Wrong!", 0
str_335 db "Final score: %d/5", 0
str_336 db "You win %d resources!", 0
str_337 db "=== LUCKY 7s SLOT MACHINE ===", 0
str_338 db "Match symbols to win big!", 0
str_339 db "Symbols: 7=JACKPOT, $=BIG, *=GOOD, C=SMALL", 0
str_340 db "Three matching = BIG WIN!", 0
str_341 db "Two matching = Small win", 0
str_342 db "Enter bet amount (10-100): ", 0
scanf_fmt_343 db "%d", 0
str_344 db "Bet set to minimum: 10", 0
str_345 db "Bet capped at maximum: 100", 0
str_346 db "Not enough resources! Need %d of each.", 0
str_347 db "Bet placed: %d of each resource", 0
str_348 db "Spinning...", 0
str_349 db ".", 0
str_350 db "=== SLOT RESULTS ===", 0
temp_str_351 db "?", 0
temp_str_352 db "?", 0
temp_str_353 db "7", 0
temp_str_354 db "SEVEN", 0
temp_str_355 db "$", 0
temp_str_356 db "DOLLAR", 0
temp_str_357 db "*", 0
temp_str_358 db "STAR", 0
temp_str_359 db "C", 0
temp_str_360 db "CHERRY", 0
temp_str_361 db "?", 0
temp_str_362 db "?", 0
temp_str_363 db "7", 0
temp_str_364 db "SEVEN", 0
temp_str_365 db "$", 0
temp_str_366 db "DOLLAR", 0
temp_str_367 db "*", 0
temp_str_368 db "STAR", 0
temp_str_369 db "C", 0
temp_str_370 db "CHERRY", 0
temp_str_371 db "?", 0
temp_str_372 db "?", 0
temp_str_373 db "7", 0
temp_str_374 db "SEVEN", 0
temp_str_375 db "$", 0
temp_str_376 db "DOLLAR", 0
temp_str_377 db "*", 0
temp_str_378 db "STAR", 0
temp_str_379 db "C", 0
temp_str_380 db "CHERRY", 0
str_381 db "     [ ? ]   [ ? ]   [ ? ]", 0
str_382 db "     [ %s ]   [ ? ]   [ ? ]", 0
str_383 db "     [ %s ]   [ %s ]   [ ? ]", 0
str_384 db "     [ %s ]   [ %s ]   [ %s ]", 0
str_385 db "Symbols: %s  %s  %s", 0
str_386 db "JACKPOT! THREE 7s!", 0
str_387 db "BIG WIN! Three dollars!", 0
str_388 db "NICE! Three stars!", 0
str_389 db "Good win! Three cherries!", 0
str_390 db "Two matching! Small win.", 0
str_391 db "No matching symbols. Better luck next time!", 0
str_392 db "YOU WIN: %d of each resource!", 0
str_393 db "(Profit: +%d each)", 0
str_394 db "(Break even)", 0
str_395 db "(Loss: %d each)", 0
str_396 db "You lost your bet of %d each.", 0
str_397 db "PAYOUTS:", 0
str_398 db "Three 7s:       20x bet", 0
str_399 db "Three $:         8x bet", 0
str_400 db "Three *:         5x bet", 0
str_401 db "Three C:         3x bet", 0
str_402 db "Two matching:    2x bet", 0
str_403 db "+%d wood", 0
str_404 db "+%d stone", 0
str_405 db "+%d gold", 0
str_406 db "Daily reward collected!", 0
str_407 db "Daily reward already collected.", 0
str_408 db "No boss right now.", 0
str_409 db "You deal %d damage!", 0
str_410 db "Boss defeated! Massive resource drop!", 0
str_411 db "Boss HP: %d", 0
str_412 db "=== MARKETPLACE ===", 0
str_413 db "Exchange rates fluctuate! (Refreshes when you leave)", 0
str_414 db "1. Wood -> Stone (rate: 1:%d)", 0
str_415 db "   Exchange %d wood for %d stone", 0
str_416 db "2. Stone -> Gold (rate: 1:%d)", 0
str_417 db "   Exchange %d stone for %d gold", 0
str_418 db "3. Gold -> Wood (rate: 1:%d)", 0
str_419 db "   Exchange %d gold for %d wood", 0
str_420 db "4. Bulk Exchange (10x amount)", 0
str_421 db "   Requires 10x resources but better rate!", 0
str_422 db "5. Speculate (Risk/Reward)", 0
str_423 db "   Bet resources on market movement", 0
str_424 db "6. Refresh Rates (cost: 10 gold)", 0
str_425 db "   Get new exchange rates", 0
str_426 db "7. Exit Marketplace", 0
str_427 db "Enter choice (1-7): ", 0
scanf_fmt_428 db "%d", 0
str_429 db "Traded %d wood for %d stone!", 0
str_430 db "Not enough wood! Need %d, have %d", 0
str_431 db "Traded %d stone for %d gold!", 0
str_432 db "Not enough stone! Need %d, have %d", 0
str_433 db "Traded %d gold for %d wood!", 0
str_434 db "Not enough gold! Need %d, have %d", 0
str_435 db "=== BULK EXCHANGE ===", 0
str_436 db "Exchange 10x resources for bonus rate!", 0
str_437 db "1. Wood -> Stone (rate: 1:%d + %d bonus)", 0
str_438 db "2. Stone -> Gold (rate: 1:%d + %d bonus)", 0
str_439 db "3. Gold -> Wood (rate: 1:%d + %d bonus)", 0
str_440 db "4. Back", 0
str_441 db "Enter bulk choice: ", 0
scanf_fmt_442 db "%d", 0
str_443 db "(Bonus rate: 1:%d)", 0
str_444 db "=== MARKET SPECULATION ===", 0
str_445 db "Bet resources on market movement!", 0
str_446 db "Choose resource to bet:", 0
str_447 db "1. Bet on WOOD price increase", 0
str_448 db "   (Win: 2x wood, Lose: lose bet)", 0
str_449 db "2. Bet on STONE price increase", 0
str_450 db "   (Win: 2x stone, Lose: lose bet)", 0
str_451 db "3. Bet on GOLD price increase", 0
str_452 db "   (Win: 2x gold, Lose: lose bet)", 0
str_453 db "Enter speculation choice: ", 0
scanf_fmt_454 db "%d", 0
str_455 db "Enter amount to bet (min 10): ", 0
scanf_fmt_456 db "%d", 0
str_457 db "=== MARKET MOVES IN YOUR FAVOR! ===", 0
str_458 db "Wood price soared! You win %d wood!", 0
str_459 db "Stone price soared! You win %d stone!", 0
str_460 db "Gold price soared! You win %d gold!", 0
str_461 db "=== MARKET CRASH! ===", 0
str_462 db "Wood price crashed! Lost %d wood!", 0
str_463 db "Stone price crashed! Lost %d stone!", 0
str_464 db "Gold price crashed! Lost %d gold!", 0
str_465 db "Market rates refreshed! (-10 gold)", 0
str_466 db "Need 10 gold to refresh rates!", 0
str_467 db "Leaving marketplace...", 0
str_468 db "Exiting game...", 0
str_469 db "Achievements: %d/30", 0
str_470 db "Total Resources: %d", 0
str_471 db "Turns Played: %d", 0
str_472 db "Collections Made: %d", 0
str_473 db "=== ACHIEVEMENT UNLOCKED: Resource Baron! (100+ total resources) ===", 0
str_474 db "=== ACHIEVEMENT UNLOCKED: Wealthy Magnate! (1,000+ total resources) ===", 0
str_475 db "=== ACHIEVEMENT UNLOCKED: Resource Millionaire! (10,000+ total resources) ===", 0
str_476 db "=== ACHIEVEMENT UNLOCKED: Lumberjack! (50+ wood) ===", 0
str_477 db "=== ACHIEVEMENT UNLOCKED: Quarry King! (50+ stone) ===", 0
str_478 db "=== ACHIEVEMENT UNLOCKED: Gold Digger! (50+ gold) ===", 0
str_479 db "=== ACHIEVEMENT UNLOCKED: Wood Tycoon! (500+ wood) ===", 0
str_480 db "=== ACHIEVEMENT UNLOCKED: Stone Tycoon! (500+ stone) ===", 0
str_481 db "=== ACHIEVEMENT UNLOCKED: Gold Tycoon! (500+ gold) ===", 0
str_482 db "=== ACHIEVEMENT UNLOCKED: Minigame Master! (10 minigame wins) ===", 0
str_483 db "=== ACHIEVEMENT UNLOCKED: Event Explorer! (20 random events) ===", 0
str_484 db "=== ACHIEVEMENT UNLOCKED: Turn Veteran! (100 turns played) ===", 0
str_485 db "=== ACHIEVEMENT UNLOCKED: Collector Addict! (200 collections made) ===", 0
str_486 db "=== ACHIEVEMENT UNLOCKED: Iron Fist! (Level 100) ===", 0
str_487 db "=== ACHIEVEMENT UNLOCKED: Collector Pro! (500 collections) ===", 0
str_488 db "=== ACHIEVEMENT UNLOCKED: Ultra Rich! (100,000+ total resources) ===", 0
str_489 db "=== ACHIEVEMENT UNLOCKED: Grinder! (500 turns played) ===", 0
str_490 db "=== ACHIEVEMENT UNLOCKED: Hoarder! (5,000+ of a resource) ===", 0
str_491 db "=== ACHIEVEMENT UNLOCKED: Unstoppable! (25 minigame wins) ===", 0
str_492 db "=== ACHIEVEMENT UNLOCKED: Event Legend! (100 random events) ===", 0
str_493 db "=== ACHIEVEMENT UNLOCKED: Jackpot! (15 minigame wins) ===", 0
str_494 db "=== ACHIEVEMENT UNLOCKED: Dedicated! (1,000 turns played) ===", 0
str_495 db "=== ACHIEVEMENT UNLOCKED: Maxed Out! (Level 200) ===", 0
str_496 db "=== ACHIEVEMENT UNLOCKED: Trader! (10 trades made) ===", 0
str_497 db "=== ACHIEVEMENT UNLOCKED: Speculator! (5 market bets made) ===", 0
str_498 db "=== ACHIEVEMENT UNLOCKED: Market Tycoon! (50 trades made) ===", 0
str_499 db "=== ACHIEVEMENT UNLOCKED: Master Builder! (5 buildings built) ===", 0
cmd_500 db "cls", 0
str_501 db "Turn: %d", 0
str_502 db "Auto Collect Rate: %d", 0
str_503 db "Prestige: Level %d (x%d bonus)", 0
str_504 db "A wild RESOURCE GOLEM appears!", 0

section .bss
var_wood resd 1
var_stone resd 1
var_gold resd 1
var_level resd 1
var_upgradecost resd 1
var_autocollect resd 1
var_turn resd 1
var_gameover resd 1
var_multiplier resd 1
var_eventcounter resd 1
var_lastdaily resd 1
var_dailyclaimed resd 1
var_prestigelevel resd 1
var_prestigebonus resd 1
var_prestigecost resd 1
var_achievements resd 1
var_firstcollect resd 1
var_level5 resd 1
var_level10 resd 1
var_level20 resd 1
var_level50 resd 1
var_rich resd 1
var_wealthy resd 1
var_millionaire resd 1
var_shopaholic resd 1
var_minigamemaster resd 1
var_lucky resd 1
var_speedrunner resd 1
var_woodmaster resd 1
var_stonemaster resd 1
var_goldmaster resd 1
var_woodtycoon resd 1
var_stonetycoon resd 1
var_goldtycoon resd 1
var_eventexplorer resd 1
var_turnveteran resd 1
var_collectoraddict resd 1
var_traderachievement resd 1
var_speculatorachievement resd 1
var_markettycoon resd 1
var_ironfist resd 1
var_collectorpro resd 1
var_ultrarich resd 1
var_grinder resd 1
var_hoarder resd 1
var_unstoppable resd 1
var_eventlegend resd 1
var_jackpot resd 1
var_dedicated resd 1
var_maxedout resd 1
var_hascollected resd 1
var_shoppurchases resd 1
var_minigameplays resd 1
var_minigamewins resd 1
var_totalevents resd 1
var_totalcollections resd 1
var_bossready resd 1
var_bossalive resd 1
var_bosshp resd 1
var_rpschoice resd 1
var_tradesmade resd 1
var_speculationsmade resd 1
var_lumbermill resd 1
var_quarry resd 1
var_goldmine resd 1
var_warehouse resd 1
var_lumbermillcostwood resd 1
var_lumbermillcoststone resd 1
var_quarrycostwood resd 1
var_quarrycoststone resd 1
var_goldminecostwood resd 1
var_goldminecoststone resd 1
var_warehousecost resd 1
var_buildingachievement resd 1
var_totalbuildings resd 1
var_result resd 1
var_hnd_user32_dll resd 1
var_ptr_MessageBoxA resd 1
var_eventtype resd 1
var_rand_state_4 resd 1
var_bonuswood resd 1
var_rand_state_7 resd 1
var_bonusstone resd 1
var_rand_state_9 resd 1
var_bonusgold resd 1
var_rand_state_11 resd 1
var_totalcollect resd 1
var_basecollect resd 1
var_cmd resd 1
var_resourcetype resd 1
var_rand_state_38 resd 1
var_collectamount resd 1
var_requiredwood resd 1
var_requiredstone resd 1
var_requiredgold resd 1
var_canupgrade resd 1
var_nextwood resd 1
var_nextstone resd 1
var_nextgold resd 1
var_shopopen resd 1
var_currenttotal resd 1
var_choice resd 1
var_boostcost resd 1
var_coststone resd 1
var_costgold resd 1
var_woodbonus resd 1
var_costwood resd 1
var_stonebonus resd 1
var_totalresources resd 1
var_gamechoice resd 1
var_secretnumber resd 1
var_rand_state_130 resd 1
var_guess resd 1
var_reward resd 1
var_currentcard resd 1
var_rand_state_133 resd 1
var_streak resd 1
var_maxstreak resd 1
var_round resd 1
var_playerguess resd 1
var_nextcard resd 1
var_rand_state_135 resd 1
var_correct resd 1
var_continue resd 1
var_correctanswers resd 1
var_totalquestions resd 1
var_maxnumber resd 1
var_question resd 1
var_num1 resd 1
var_rand_state_151 resd 1
var_num2 resd 1
var_rand_state_152 resd 1
var_operation resd 1
var_rand_state_153 resd 1
var_temp123124 resd 1
var_rand_state_155 resd 1
var_correctanswer resd 1
var_playeranswer resd 1
var_playerwins resd 1
var_botwins resd 1
var_botchoice resd 1
var_rand_state_166 resd 1
var_playerwinsround resd 1
var_betamount resd 1
var_canbet resd 1
var_die1 resd 1
var_rand_state_192 resd 1
var_die2 resd 1
var_rand_state_193 resd 1
var_playertotal resd 1
var_compdie1 resd 1
var_rand_state_194 resd 1
var_compdie2 resd 1
var_rand_state_195 resd 1
var_comptotal resd 1
var_playerdoubles resd 1
var_compdoubles resd 1
var_loss resd 1
var_coin resd 1
var_rand_state_209 resd 1
var_score resd 1
var_currentnum resd 1
var_rand_state_213 resd 1
var_nextnum resd 1
var_rand_state_215 resd 1
var_canplay resd 1
var_reel1 resd 1
var_rand_state_228 resd 1
var_reel2 resd 1
var_rand_state_229 resd 1
var_reel3 resd 1
var_rand_state_230 resd 1
var_symbol1 resb 256
var_symbolname1 resb 256
var_symbol2 resb 256
var_symbolname2 resb 256
var_symbol3 resb 256
var_symbolname3 resb 256
var_wintype resd 1
var_net resd 1
var_rewardwood resd 1
var_rewardstone resd 1
var_rewardgold resd 1
var_damage resd 1
var_leveltimes50 resd 1
var_marketopen resd 1
var_woodexchangerate resd 1
var_rand_state_262 resd 1
var_stoneexchangerate resd 1
var_rand_state_263 resd 1
var_goldexchangerate resd 1
var_rand_state_264 resd 1
var_baseamount resd 1
var_stonegain resd 1
var_goldgain resd 1
var_woodgain resd 1
var_bulksamount resd 1
var_bulkbonus resd 1
var_rand_state_277 resd 1
var_bulkchoice resd 1
var_specchoice resd 1
var_specresult resd 1
var_rand_state_294 resd 1
var_winnings resd 1
var_rand_state_304 resd 1
var_rand_state_305 resd 1
var_rand_state_306 resd 1
var_total resd 1
var_buildingbonus resd 1
var_warehousebonus resd 1
var_freq resd 1

section .text
global _main
_main:
    mov eax, 0
    mov dword [var_wood], eax
    mov eax, 0
    mov dword [var_stone], eax
    mov eax, 0
    mov dword [var_gold], eax
    mov eax, 1
    mov dword [var_level], eax
    mov eax, 5
    mov dword [var_upgradecost], eax
    mov eax, 0
    mov dword [var_autocollect], eax
    mov eax, 0
    mov dword [var_turn], eax
    mov eax, 0
    mov dword [var_gameover], eax
    mov eax, 1
    mov dword [var_multiplier], eax
    mov eax, 0
    mov dword [var_eventcounter], eax
    mov eax, 0
    mov dword [var_lastdaily], eax
    mov eax, 0
    mov dword [var_dailyclaimed], eax
    mov eax, 0
    mov dword [var_prestigelevel], eax
    mov eax, 1
    mov dword [var_prestigebonus], eax
    mov eax, 750
    mov dword [var_prestigecost], eax
    mov eax, 0
    mov dword [var_achievements], eax
    mov eax, 0
    mov dword [var_firstcollect], eax
    mov eax, 0
    mov dword [var_level5], eax
    mov eax, 0
    mov dword [var_level10], eax
    mov eax, 0
    mov dword [var_level20], eax
    mov eax, 0
    mov dword [var_level50], eax
    mov eax, 0
    mov dword [var_rich], eax
    mov eax, 0
    mov dword [var_wealthy], eax
    mov eax, 0
    mov dword [var_millionaire], eax
    mov eax, 0
    mov dword [var_shopaholic], eax
    mov eax, 0
    mov dword [var_minigamemaster], eax
    mov eax, 0
    mov dword [var_lucky], eax
    mov eax, 0
    mov dword [var_speedrunner], eax
    mov eax, 0
    mov dword [var_woodmaster], eax
    mov eax, 0
    mov dword [var_stonemaster], eax
    mov eax, 0
    mov dword [var_goldmaster], eax
    mov eax, 0
    mov dword [var_woodtycoon], eax
    mov eax, 0
    mov dword [var_stonetycoon], eax
    mov eax, 0
    mov dword [var_goldtycoon], eax
    mov eax, 0
    mov dword [var_eventexplorer], eax
    mov eax, 0
    mov dword [var_turnveteran], eax
    mov eax, 0
    mov dword [var_collectoraddict], eax
    mov eax, 0
    mov dword [var_traderachievement], eax
    mov eax, 0
    mov dword [var_speculatorachievement], eax
    mov eax, 0
    mov dword [var_markettycoon], eax
    mov eax, 0
    mov dword [var_ironfist], eax
    mov eax, 0
    mov dword [var_collectorpro], eax
    mov eax, 0
    mov dword [var_ultrarich], eax
    mov eax, 0
    mov dword [var_grinder], eax
    mov eax, 0
    mov dword [var_hoarder], eax
    mov eax, 0
    mov dword [var_unstoppable], eax
    mov eax, 0
    mov dword [var_eventlegend], eax
    mov eax, 0
    mov dword [var_jackpot], eax
    mov eax, 0
    mov dword [var_dedicated], eax
    mov eax, 0
    mov dword [var_maxedout], eax
    mov eax, 0
    mov dword [var_hascollected], eax
    mov eax, 0
    mov dword [var_shoppurchases], eax
    mov eax, 0
    mov dword [var_minigameplays], eax
    mov eax, 0
    mov dword [var_minigamewins], eax
    mov eax, 0
    mov dword [var_totalevents], eax
    mov eax, 0
    mov dword [var_totalcollections], eax
    mov eax, 0
    mov dword [var_bossready], eax
    mov eax, 0
    mov dword [var_bossalive], eax
    mov eax, 0
    mov dword [var_bosshp], eax
    mov eax, 0
    mov dword [var_rpschoice], eax
    mov eax, 0
    mov dword [var_tradesmade], eax
    mov eax, 0
    mov dword [var_speculationsmade], eax
    mov eax, 0
    mov dword [var_lumbermill], eax
    mov eax, 0
    mov dword [var_quarry], eax
    mov eax, 0
    mov dword [var_goldmine], eax
    mov eax, 0
    mov dword [var_warehouse], eax
    mov eax, 50
    mov dword [var_lumbermillcostwood], eax
    mov eax, 20
    mov dword [var_lumbermillcoststone], eax
    mov eax, 30
    mov dword [var_quarrycostwood], eax
    mov eax, 60
    mov dword [var_quarrycoststone], eax
    mov eax, 100
    mov dword [var_goldminecostwood], eax
    mov eax, 100
    mov dword [var_goldminecoststone], eax
    mov eax, 200
    mov dword [var_warehousecost], eax
    mov eax, 0
    mov dword [var_buildingachievement], eax
    mov eax, 0
    mov dword [var_totalbuildings], eax
    mov eax, 4
    push eax
    mov eax, str_0
    push eax
    mov eax, str_1
    push eax
    mov eax, 0
    push eax
    cmp dword [var_hnd_user32_dll], 0
    jne hnd_user32_dll_loaded
    push dll_hnd_user32_dll
    call _LoadLibraryA@4
    mov [var_hnd_user32_dll], eax
hnd_user32_dll_loaded:
    cmp dword [var_ptr_MessageBoxA], 0
    jne ptr_MessageBoxA_resolved
    push func_MessageBoxA
    push dword [var_hnd_user32_dll]
    call _GetProcAddress@8
    mov [var_ptr_MessageBoxA], eax
ptr_MessageBoxA_resolved:
    call [var_ptr_MessageBoxA]
    mov dword [var_result], eax
    mov eax, dword [var_result]
    mov ebx, 7
    cmp eax, ebx
    je if_then_1
    jmp if_else_1
if_then_1:
    mov eax, 1
    ret
    jmp if_end_1
if_else_1:
if_end_1:
    call _clearscreen
    push 50
    call _boop
    add esp, 4
loop_start_2:
    call _clearscreen
    push str_2
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_4
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_eventcounter]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_eventcounter], eax
    mov eax, dword [var_eventcounter]
    mov ebx, 5
    cmp eax, ebx
    je if_then_3
    jmp if_else_3
if_then_3:
    cmp dword [var_rand_state_4], 0
    jne rand_init_4
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_4], eax
rand_init_4:
    mov eax, dword [var_rand_state_4]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_4]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_4], eax
    mov dword [var_rand_state_4], eax
    mov ecx, 1
    mov ebx, 5
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_eventtype], eax
    mov eax, dword [var_totalevents]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_totalevents], eax
    mov eax, dword [var_eventtype]
    mov ebx, 1
    cmp eax, ebx
    je if_then_5
    jmp if_else_5
if_then_5:
    push str_5
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 2
    mov dword [var_multiplier], eax
    push 1500
    call _Sleep@4
    mov eax, 1
    mov dword [var_lucky], eax
    push str_6
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_5
if_else_5:
if_end_5:
    mov eax, dword [var_eventtype]
    mov ebx, 2
    cmp eax, ebx
    je if_then_6
    jmp if_else_6
if_then_6:
    cmp dword [var_rand_state_7], 0
    jne rand_init_7
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_7], eax
rand_init_7:
    mov eax, dword [var_rand_state_7]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_7]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_7], eax
    mov dword [var_rand_state_7], eax
    mov ecx, 5
    mov ebx, 15
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_bonuswood], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_bonuswood]
    pop ebx
    add ebx, dword [var_bonuswood]
    mov eax, ebx
    mov dword [var_wood], eax
    push dword [var_bonuswood]
    push str_7
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_6
if_else_6:
if_end_6:
    mov eax, dword [var_eventtype]
    mov ebx, 3
    cmp eax, ebx
    je if_then_8
    jmp if_else_8
if_then_8:
    cmp dword [var_rand_state_9], 0
    jne rand_init_9
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_9], eax
rand_init_9:
    mov eax, dword [var_rand_state_9]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_9]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_9], eax
    mov dword [var_rand_state_9], eax
    mov ecx, 3
    mov ebx, 10
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_bonusstone], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_bonusstone]
    pop ebx
    add ebx, dword [var_bonusstone]
    mov eax, ebx
    mov dword [var_stone], eax
    push dword [var_bonusstone]
    push str_8
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_8
if_else_8:
if_end_8:
    mov eax, dword [var_eventtype]
    mov ebx, 4
    cmp eax, ebx
    je if_then_10
    jmp if_else_10
if_then_10:
    cmp dword [var_rand_state_11], 0
    jne rand_init_11
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_11], eax
rand_init_11:
    mov eax, dword [var_rand_state_11]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_11]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_11], eax
    mov dword [var_rand_state_11], eax
    mov ecx, 1
    mov ebx, 5
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_bonusgold], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_bonusgold]
    pop ebx
    add ebx, dword [var_bonusgold]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_bonusgold]
    push str_9
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_10
if_else_10:
if_end_10:
    mov eax, dword [var_eventtype]
    mov ebx, 5
    cmp eax, ebx
    je if_then_12
    jmp if_else_12
if_then_12:
    push str_3
    call _printf
    add esp, 4
    push str_10
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 3
    mov dword [var_multiplier], eax
    push 300
    call _boop
    add esp, 4
    jmp if_end_12
if_else_12:
if_end_12:
    mov eax, 0
    mov dword [var_eventcounter], eax
    jmp if_end_3
if_else_3:
if_end_3:
    mov eax, dword [var_bossready]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_bossready], eax
    mov eax, dword [var_bossready]
    mov ebx, 30
    cmp eax, ebx
    je if_then_13
    jmp if_else_13
if_then_13:
    push dword [var_level]
    push dword [var_bosshp]
    push dword [var_bossalive]
    call _spawnboss
    add esp, 12
    mov eax, 0
    mov dword [var_bossready], eax
    jmp if_end_13
if_else_13:
if_end_13:
    push dword [var_warehouse]
    push dword [var_goldmine]
    push dword [var_quarry]
    push dword [var_lumbermill]
    push dword [var_totalcollect]
    push dword [var_gold]
    push dword [var_stone]
    push dword [var_wood]
    push dword [var_prestigebonus]
    push dword [var_basecollect]
    push dword [var_multiplier]
    push dword [var_autocollect]
    call _autocollectresources
    add esp, 48
    push dword [var_achievements]
    push dword [var_prestigebonus]
    push dword [var_prestigelevel]
    push dword [var_multiplier]
    push dword [var_autocollect]
    push dword [var_level]
    push dword [var_gold]
    push dword [var_stone]
    push dword [var_wood]
    push dword [var_turn]
    call _showstats
    add esp, 40
    push str_11
    call _printf
    add esp, 4
    push var_cmd
    push scanf_fmt_12
    call _scanf
    add esp, 8
    mov eax, dword [var_cmd]
    mov ebx, 1337
    cmp eax, ebx
    je if_then_14
    jmp if_else_14
if_then_14:
    push 300
    call _boop
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push str_13
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_14
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 337
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 337
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 337
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_14
if_else_14:
if_end_14:
    mov eax, dword [var_cmd]
    mov ebx, 42
    cmp eax, ebx
    je if_then_15
    jmp if_else_15
if_then_15:
    push str_15
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_16
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_15
if_else_15:
if_end_15:
    mov eax, dword [var_cmd]
    mov ebx, 777
    cmp eax, ebx
    je if_then_16
    jmp if_else_16
if_then_16:
    push 300
    call _boop
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push str_17
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_18
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_level], eax
    mov eax, dword [var_level]
    mov dword [var_autocollect], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, 77
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 77
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 77
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_16
if_else_16:
if_end_16:
    mov eax, dword [var_cmd]
    mov ebx, 911
    cmp eax, ebx
    je if_then_17
    jmp if_else_17
if_then_17:
    push str_19
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_20
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 911
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 911
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 911
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_17
if_else_17:
if_end_17:
    mov eax, dword [var_cmd]
    mov ebx, 1234
    cmp eax, ebx
    je if_then_18
    jmp if_else_18
if_then_18:
    push str_21
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_22
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1234
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    push 1500
    call _Sleep@4
    jmp if_end_18
if_else_18:
if_end_18:
    mov eax, dword [var_cmd]
    mov ebx, 999
    cmp eax, ebx
    je if_then_19
    jmp if_else_19
if_then_19:
    push str_23
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_24
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_stone]
    push eax
    mov eax, 999
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    push 1500
    call _Sleep@4
    jmp if_end_19
if_else_19:
if_end_19:
    mov eax, dword [var_cmd]
    mov ebx, 314
    cmp eax, ebx
    je if_then_20
    jmp if_else_20
if_then_20:
    push str_25
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_26
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 314
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 314
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 314
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_20
if_else_20:
if_end_20:
    mov eax, dword [var_cmd]
    mov ebx, 404
    cmp eax, ebx
    je if_then_21
    jmp if_else_21
if_then_21:
    push str_27
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_28
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_gold]
    push eax
    mov eax, 404
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_21
if_else_21:
if_end_21:
    mov eax, dword [var_cmd]
    mov ebx, 80085
    cmp eax, ebx
    je if_then_22
    jmp if_else_22
if_then_22:
    push str_29
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_30
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 800
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 800
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 800
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_22
if_else_22:
if_end_22:
    mov eax, dword [var_cmd]
    mov ebx, 12345
    cmp eax, ebx
    je if_then_23
    jmp if_else_23
if_then_23:
    push str_31
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_32
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 4115
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 4115
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 4115
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_23
if_else_23:
if_end_23:
    mov eax, dword [var_cmd]
    mov ebx, 24601
    cmp eax, ebx
    je if_then_24
    jmp if_else_24
if_then_24:
    push str_33
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_34
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_prestigecost]
    push eax
    mov eax, 2
    pop ebx
    mov eax, ebx
    mov ebx, eax
    mov eax, ebx
    mov ebx, 2
    cdq
    idiv ebx
    mov dword [var_prestigecost], eax
    mov eax, dword [var_prestigecost]
    mov ebx, 750
    cmp eax, ebx
    jl if_then_25
    jmp if_else_25
if_then_25:
    mov eax, 750
    mov dword [var_prestigecost], eax
    jmp if_end_25
if_else_25:
if_end_25:
    push 1500
    call _Sleep@4
    jmp if_end_24
if_else_24:
if_end_24:
    mov eax, dword [var_cmd]
    mov ebx, 8675309
    cmp eax, ebx
    je if_then_26
    jmp if_else_26
if_then_26:
    push str_35
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_36
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 867
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 867
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 867
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_26
if_else_26:
if_end_26:
    mov eax, dword [var_cmd]
    mov ebx, 1776
    cmp eax, ebx
    je if_then_27
    jmp if_else_27
if_then_27:
    push str_37
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_38
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1776
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 1776
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 1776
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_27
if_else_27:
if_end_27:
    mov eax, dword [var_cmd]
    mov ebx, 1984
    cmp eax, ebx
    je if_then_28
    jmp if_else_28
if_then_28:
    push str_39
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_40
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1984
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    push 1500
    call _Sleep@4
    jmp if_end_28
if_else_28:
if_end_28:
    mov eax, dword [var_cmd]
    mov ebx, 2001
    cmp eax, ebx
    je if_then_29
    jmp if_else_29
if_then_29:
    push str_41
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_42
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_stone]
    push eax
    mov eax, 2001
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    push 1500
    call _Sleep@4
    jmp if_end_29
if_else_29:
if_end_29:
    mov eax, dword [var_cmd]
    mov ebx, 2112
    cmp eax, ebx
    je if_then_30
    jmp if_else_30
if_then_30:
    push str_43
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_44
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_gold]
    push eax
    mov eax, 2112
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_30
if_else_30:
if_end_30:
    mov eax, dword [var_cmd]
    mov ebx, 1492
    cmp eax, ebx
    je if_then_31
    jmp if_else_31
if_then_31:
    push str_45
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_46
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1492
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 1492
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 1492
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_31
if_else_31:
if_end_31:
    mov eax, dword [var_cmd]
    mov ebx, 1066
    cmp eax, ebx
    je if_then_32
    jmp if_else_32
if_then_32:
    push str_47
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_48
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1066
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 1066
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 1066
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 1500
    call _Sleep@4
    jmp if_end_32
if_else_32:
if_end_32:
    mov eax, dword [var_cmd]
    mov ebx, 69
    cmp eax, ebx
    je if_then_33
    jmp if_else_33
if_then_33:
    push str_49
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_50
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 69
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 69
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 69
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    jmp if_end_33
if_else_33:
if_end_33:
    mov eax, dword [var_cmd]
    mov ebx, 68
    cmp eax, ebx
    je if_then_34
    jmp if_else_34
if_then_34:
    push str_51
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_wood], eax
    mov eax, 0
    mov dword [var_stone], eax
    mov eax, 0
    mov dword [var_gold], eax
    mov eax, 1
    mov dword [var_level], eax
    jmp if_end_34
if_else_34:
if_end_34:
    mov eax, dword [var_cmd]
    mov ebx, 420
    cmp eax, ebx
    je if_then_35
    jmp if_else_35
if_then_35:
    push str_52
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_53
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 420
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 420
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 420
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    jmp if_end_35
if_else_35:
if_end_35:
    mov eax, dword [var_cmd]
    mov ebx, 67
    cmp eax, ebx
    je if_then_36
    jmp if_else_36
if_then_36:
    push str_49
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_54
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 67
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, 67
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, 67
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    jmp if_end_36
if_else_36:
if_end_36:
    mov eax, dword [var_cmd]
    mov ebx, 1
    cmp eax, ebx
    je if_then_37
    jmp if_else_37
if_then_37:
    push str_55
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 1
    mov dword [var_hascollected], eax
    mov eax, dword [var_totalcollections]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_totalcollections], eax
    cmp dword [var_rand_state_38], 0
    jne rand_init_38
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_38], eax
rand_init_38:
    mov eax, dword [var_rand_state_38]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_38]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_38], eax
    mov dword [var_rand_state_38], eax
    mov ecx, 1
    mov ebx, 3
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_resourcetype], eax
    mov eax, dword [var_resourcetype]
    mov ebx, 1
    cmp eax, ebx
    je if_then_39
    jmp if_else_39
if_then_39:
    mov eax, 1
    push eax
    mov eax, dword [var_multiplier]
    pop ebx
    imul ebx, dword [var_multiplier]
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_collectamount], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_collectamount]
    pop ebx
    add ebx, dword [var_collectamount]
    mov eax, ebx
    mov dword [var_wood], eax
    push dword [var_collectamount]
    push str_56
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_39
if_else_39:
if_end_39:
    mov eax, dword [var_resourcetype]
    mov ebx, 2
    cmp eax, ebx
    je if_then_40
    jmp if_else_40
if_then_40:
    mov eax, 1
    push eax
    mov eax, dword [var_multiplier]
    pop ebx
    imul ebx, dword [var_multiplier]
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_collectamount], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_collectamount]
    pop ebx
    add ebx, dword [var_collectamount]
    mov eax, ebx
    mov dword [var_stone], eax
    push dword [var_collectamount]
    push str_57
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_40
if_else_40:
if_end_40:
    mov eax, dword [var_resourcetype]
    mov ebx, 3
    cmp eax, ebx
    je if_then_41
    jmp if_else_41
if_then_41:
    mov eax, 1
    push eax
    mov eax, dword [var_multiplier]
    pop ebx
    imul ebx, dword [var_multiplier]
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_collectamount], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_collectamount]
    pop ebx
    add ebx, dword [var_collectamount]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_collectamount]
    push str_58
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_41
if_else_41:
if_end_41:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_firstcollect]
    mov ebx, 0
    cmp eax, ebx
    je if_then_42
    jmp if_else_42
if_then_42:
    mov eax, dword [var_hascollected]
    mov ebx, 1
    cmp eax, ebx
    je if_then_43
    jmp if_else_43
if_then_43:
    mov eax, 1
    mov dword [var_firstcollect], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_59
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_43
if_else_43:
if_end_43:
    jmp if_end_42
if_else_42:
if_end_42:
    jmp if_end_37
if_else_37:
if_end_37:
    mov eax, dword [var_cmd]
    mov ebx, 2
    cmp eax, ebx
    je if_then_44
    jmp if_else_44
if_then_44:
    mov eax, dword [var_level]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_requiredwood], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 3
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_requiredstone], eax
    mov eax, dword [var_level]
    mov dword [var_requiredgold], eax
    mov eax, 0
    mov dword [var_canupgrade], eax
    mov eax, dword [var_wood]
    mov ebx, dword [var_requiredwood]
    cmp eax, ebx
    jg if_then_45
    jmp if_else_45
if_then_45:
    mov eax, dword [var_stone]
    mov ebx, dword [var_requiredstone]
    cmp eax, ebx
    jg if_then_46
    jmp if_else_46
if_then_46:
    mov eax, dword [var_gold]
    mov ebx, dword [var_requiredgold]
    cmp eax, ebx
    jg if_then_47
    jmp if_else_47
if_then_47:
    mov eax, 1
    mov dword [var_canupgrade], eax
    jmp if_end_47
if_else_47:
if_end_47:
    jmp if_end_46
if_else_46:
if_end_46:
    jmp if_end_45
if_else_45:
if_end_45:
    mov eax, dword [var_wood]
    mov ebx, dword [var_requiredwood]
    cmp eax, ebx
    je if_then_48
    jmp if_else_48
if_then_48:
    mov eax, dword [var_stone]
    mov ebx, dword [var_requiredstone]
    cmp eax, ebx
    je if_then_49
    jmp if_else_49
if_then_49:
    mov eax, dword [var_gold]
    mov ebx, dword [var_requiredgold]
    cmp eax, ebx
    je if_then_50
    jmp if_else_50
if_then_50:
    mov eax, 1
    mov dword [var_canupgrade], eax
    jmp if_end_50
if_else_50:
if_end_50:
    jmp if_end_49
if_else_49:
if_end_49:
    jmp if_end_48
if_else_48:
if_end_48:
    mov eax, dword [var_canupgrade]
    mov ebx, 1
    cmp eax, ebx
    je if_then_51
    jmp if_else_51
if_then_51:
    push str_60
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_requiredwood]
    pop ebx
    sub ebx, dword [var_requiredwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_requiredstone]
    pop ebx
    sub ebx, dword [var_requiredstone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_requiredgold]
    pop ebx
    sub ebx, dword [var_requiredgold]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_level], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 10
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_upgradecost], eax
    mov eax, dword [var_level]
    mov dword [var_autocollect], eax
    push str_61
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    mov eax, dword [var_level5]
    mov ebx, 0
    cmp eax, ebx
    je if_then_52
    jmp if_else_52
if_then_52:
    mov eax, dword [var_level]
    mov ebx, 4
    cmp eax, ebx
    jg if_then_53
    jmp if_else_53
if_then_53:
    mov eax, 1
    mov dword [var_level5], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_62
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_53
if_else_53:
if_end_53:
    jmp if_end_52
if_else_52:
if_end_52:
    mov eax, dword [var_level10]
    mov ebx, 0
    cmp eax, ebx
    je if_then_54
    jmp if_else_54
if_then_54:
    mov eax, dword [var_level]
    mov ebx, 9
    cmp eax, ebx
    jg if_then_55
    jmp if_else_55
if_then_55:
    mov eax, 1
    mov dword [var_level10], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_63
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_55
if_else_55:
if_end_55:
    jmp if_end_54
if_else_54:
if_end_54:
    mov eax, dword [var_level20]
    mov ebx, 0
    cmp eax, ebx
    je if_then_56
    jmp if_else_56
if_then_56:
    mov eax, dword [var_level]
    mov ebx, 19
    cmp eax, ebx
    jg if_then_57
    jmp if_else_57
if_then_57:
    mov eax, 1
    mov dword [var_level20], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_64
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_57
if_else_57:
if_end_57:
    jmp if_end_56
if_else_56:
if_end_56:
    mov eax, dword [var_level50]
    mov ebx, 0
    cmp eax, ebx
    je if_then_58
    jmp if_else_58
if_then_58:
    mov eax, dword [var_level]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_59
    jmp if_else_59
if_then_59:
    mov eax, 1
    mov dword [var_level50], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_65
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_59
if_else_59:
if_end_59:
    jmp if_end_58
if_else_58:
if_end_58:
    mov eax, dword [var_shopaholic]
    mov ebx, 0
    cmp eax, ebx
    je if_then_60
    jmp if_else_60
if_then_60:
    mov eax, dword [var_level]
    mov ebx, 2
    cmp eax, ebx
    jg if_then_61
    jmp if_else_61
if_then_61:
    mov eax, 1
    mov dword [var_shopaholic], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_66
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_61
if_else_61:
if_end_61:
    jmp if_end_60
if_else_60:
if_end_60:
    mov eax, dword [var_speedrunner]
    mov ebx, 0
    cmp eax, ebx
    je if_then_62
    jmp if_else_62
if_then_62:
    mov eax, dword [var_level]
    mov ebx, 4
    cmp eax, ebx
    jg if_then_63
    jmp if_else_63
if_then_63:
    mov eax, dword [var_turn]
    mov ebx, 21
    cmp eax, ebx
    jl if_then_64
    jmp if_else_64
if_then_64:
    mov eax, 1
    mov dword [var_speedrunner], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_67
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_64
if_else_64:
if_end_64:
    jmp if_end_63
if_else_63:
if_end_63:
    jmp if_end_62
if_else_62:
if_end_62:
    jmp if_end_51
if_else_51:
    push str_68
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_requiredgold]
    push dword [var_requiredstone]
    push dword [var_requiredwood]
    push str_69
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
if_end_51:
    jmp if_end_44
if_else_44:
if_end_44:
    mov eax, dword [var_cmd]
    mov ebx, 3
    cmp eax, ebx
    je if_then_65
    jmp if_else_65
if_then_65:
    call _clearscreen
    push str_70
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_wood]
    push str_71
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_stone]
    push str_72
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_gold]
    push str_73
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_level]
    push str_74
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_autocollect]
    push str_75
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_upgradecost]
    push str_76
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_prestigelevel]
    push str_77
    call _printf
    add esp, 8
    push dword [var_prestigebonus]
    push str_78
    call _printf
    add esp, 8
    push dword [var_prestigecost]
    push str_79
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_lumbermill]
    push dword [var_lumbermill]
    push str_80
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_quarry]
    push dword [var_quarry]
    push str_81
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_goldmine]
    push dword [var_goldmine]
    push str_82
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_warehouse]
    push dword [var_warehouse]
    push str_83
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_nextwood], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 3
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_nextstone], eax
    mov eax, dword [var_level]
    mov dword [var_nextgold], eax
    push dword [var_nextgold]
    push dword [var_nextstone]
    push dword [var_nextwood]
    push str_84
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push dword [var_multiplier]
    push str_85
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_achievements]
    push str_86
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 1000
    call _Sleep@4
    jmp if_end_65
if_else_65:
if_end_65:
    mov eax, dword [var_cmd]
    mov ebx, 4
    cmp eax, ebx
    je if_then_66
    jmp if_else_66
if_then_66:
    mov eax, 1
    mov dword [var_shopopen], eax
while_start_67:
    mov eax, dword [var_shopopen]
    mov ebx, 1
    cmp eax, ebx
    jne while_end_67
    call _clearscreen
    push str_87
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_88
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_gold]
    push dword [var_stone]
    push dword [var_wood]
    push str_89
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push str_90
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_lumbermill]
    push dword [var_lumbermill]
    push str_80
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_quarry]
    push dword [var_quarry]
    push str_81
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_goldmine]
    push dword [var_goldmine]
    push str_82
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_warehouse]
    push dword [var_warehouse]
    push str_83
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_upgradecost]
    push str_92
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_upgradecost]
    push dword [var_upgradecost]
    push str_93
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_upgradecost]
    push dword [var_upgradecost]
    push str_94
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_95
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_96
    call _printf
    add esp, 4
    push dword [var_lumbermillcoststone]
    push dword [var_lumbermillcostwood]
    push str_97
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_98
    call _printf
    add esp, 4
    push dword [var_quarrycoststone]
    push dword [var_quarrycostwood]
    push str_97
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_99
    call _printf
    add esp, 4
    push dword [var_goldminecoststone]
    push dword [var_goldminecostwood]
    push str_97
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_100
    call _printf
    add esp, 4
    push dword [var_warehousecost]
    push str_101
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_102
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_103
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_stone]
    pop ebx
    add ebx, dword [var_stone]
    mov eax, ebx
    mov dword [var_currenttotal], eax
    mov eax, dword [var_currenttotal]
    push eax
    mov eax, dword [var_gold]
    pop ebx
    add ebx, dword [var_gold]
    mov eax, ebx
    mov dword [var_currenttotal], eax
    push dword [var_prestigecost]
    push str_104
    call _printf
    add esp, 8
    push dword [var_prestigecost]
    push dword [var_currenttotal]
    push str_105
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_106
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_107
    call _printf
    add esp, 4
    push var_choice
    push scanf_fmt_108
    call _scanf
    add esp, 8
    mov eax, dword [var_choice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_68
    jmp if_else_68
if_then_68:
    mov eax, dword [var_upgradecost]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_boostcost], eax
    mov eax, dword [var_gold]
    mov ebx, dword [var_boostcost]
    cmp eax, ebx
    jg if_then_69
    jmp if_else_69
if_then_69:
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_boostcost]
    pop ebx
    sub ebx, dword [var_boostcost]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_multiplier]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_multiplier], eax
    push dword [var_multiplier]
    push str_109
    call _printf
    add esp, 8
    push 300
    call _boop
    add esp, 4
    jmp if_end_69
if_else_69:
    push dword [var_boostcost]
    push str_110
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_69:
    push 1000
    call _Sleep@4
    jmp if_end_68
if_else_68:
if_end_68:
    mov eax, dword [var_choice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_70
    jmp if_else_70
if_then_70:
    mov eax, dword [var_upgradecost]
    mov dword [var_coststone], eax
    mov eax, dword [var_upgradecost]
    push eax
    mov eax, 2
    pop ebx
    mov eax, ebx
    mov ebx, eax
    mov eax, ebx
    mov ebx, 2
    cdq
    idiv ebx
    mov dword [var_costgold], eax
    mov eax, dword [var_stone]
    mov ebx, dword [var_coststone]
    cmp eax, ebx
    jg if_then_71
    jmp if_else_71
if_then_71:
    mov eax, dword [var_gold]
    mov ebx, dword [var_costgold]
    cmp eax, ebx
    jg if_then_72
    jmp if_else_72
if_then_72:
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_coststone]
    pop ebx
    sub ebx, dword [var_coststone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_costgold]
    pop ebx
    sub ebx, dword [var_costgold]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 5
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_woodbonus], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_woodbonus]
    pop ebx
    add ebx, dword [var_woodbonus]
    mov eax, ebx
    mov dword [var_wood], eax
    push dword [var_woodbonus]
    push str_111
    call _printf
    add esp, 8
    push 300
    call _boop
    add esp, 4
    jmp if_end_72
if_else_72:
    push dword [var_costgold]
    push str_112
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_72:
    jmp if_end_71
if_else_71:
    push dword [var_coststone]
    push str_113
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_71:
    push 1000
    call _Sleep@4
    jmp if_end_70
if_else_70:
if_end_70:
    mov eax, dword [var_choice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_73
    jmp if_else_73
if_then_73:
    mov eax, dword [var_upgradecost]
    mov dword [var_costwood], eax
    mov eax, dword [var_upgradecost]
    push eax
    mov eax, 2
    pop ebx
    mov eax, ebx
    mov ebx, eax
    mov eax, ebx
    mov ebx, 2
    cdq
    idiv ebx
    mov dword [var_costgold], eax
    mov eax, dword [var_wood]
    mov ebx, dword [var_costwood]
    cmp eax, ebx
    jg if_then_74
    jmp if_else_74
if_then_74:
    mov eax, dword [var_gold]
    mov ebx, dword [var_costgold]
    cmp eax, ebx
    jg if_then_75
    jmp if_else_75
if_then_75:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_costwood]
    pop ebx
    sub ebx, dword [var_costwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_costgold]
    pop ebx
    sub ebx, dword [var_costgold]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 5
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_stonebonus], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_stonebonus]
    pop ebx
    add ebx, dword [var_stonebonus]
    mov eax, ebx
    mov dword [var_stone], eax
    push dword [var_stonebonus]
    push str_114
    call _printf
    add esp, 8
    push 300
    call _boop
    add esp, 4
    jmp if_end_75
if_else_75:
    push dword [var_costgold]
    push str_112
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_75:
    jmp if_end_74
if_else_74:
    push dword [var_costwood]
    push str_115
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_74:
    push 1000
    call _Sleep@4
    jmp if_end_73
if_else_73:
if_end_73:
    mov eax, dword [var_choice]
    mov ebx, 4
    cmp eax, ebx
    je if_then_76
    jmp if_else_76
if_then_76:
    mov eax, dword [var_wood]
    mov ebx, dword [var_lumbermillcostwood]
    cmp eax, ebx
    jg if_then_77
    jmp if_else_77
if_then_77:
    mov eax, dword [var_stone]
    mov ebx, dword [var_lumbermillcoststone]
    cmp eax, ebx
    jg if_then_78
    jmp if_else_78
if_then_78:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_lumbermillcostwood]
    pop ebx
    sub ebx, dword [var_lumbermillcostwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_lumbermillcoststone]
    pop ebx
    sub ebx, dword [var_lumbermillcoststone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_lumbermill]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_lumbermill], eax
    mov eax, dword [var_totalbuildings]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_totalbuildings], eax
    push str_116
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_lumbermill]
    push str_117
    call _printf
    add esp, 8
    push 400
    call _boop
    add esp, 4
    mov eax, dword [var_lumbermillcostwood]
    push eax
    mov eax, 20
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_lumbermillcostwood], eax
    mov eax, dword [var_lumbermillcoststone]
    push eax
    mov eax, 10
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_lumbermillcoststone], eax
    jmp if_end_78
if_else_78:
    push dword [var_lumbermillcoststone]
    push str_113
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_78:
    jmp if_end_77
if_else_77:
    push dword [var_lumbermillcostwood]
    push str_115
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_77:
    push 1000
    call _Sleep@4
    jmp if_end_76
if_else_76:
if_end_76:
    mov eax, dword [var_choice]
    mov ebx, 5
    cmp eax, ebx
    je if_then_79
    jmp if_else_79
if_then_79:
    mov eax, dword [var_wood]
    mov ebx, dword [var_quarrycostwood]
    cmp eax, ebx
    jg if_then_80
    jmp if_else_80
if_then_80:
    mov eax, dword [var_stone]
    mov ebx, dword [var_quarrycoststone]
    cmp eax, ebx
    jg if_then_81
    jmp if_else_81
if_then_81:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_quarrycostwood]
    pop ebx
    sub ebx, dword [var_quarrycostwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_quarrycoststone]
    pop ebx
    sub ebx, dword [var_quarrycoststone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_quarry]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_quarry], eax
    mov eax, dword [var_totalbuildings]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_totalbuildings], eax
    push str_118
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_quarry]
    push str_119
    call _printf
    add esp, 8
    push 400
    call _boop
    add esp, 4
    mov eax, dword [var_quarrycostwood]
    push eax
    mov eax, 15
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_quarrycostwood], eax
    mov eax, dword [var_quarrycoststone]
    push eax
    mov eax, 30
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_quarrycoststone], eax
    jmp if_end_81
if_else_81:
    push dword [var_quarrycoststone]
    push str_113
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_81:
    jmp if_end_80
if_else_80:
    push dword [var_quarrycostwood]
    push str_115
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_80:
    push 1000
    call _Sleep@4
    jmp if_end_79
if_else_79:
if_end_79:
    mov eax, dword [var_choice]
    mov ebx, 6
    cmp eax, ebx
    je if_then_82
    jmp if_else_82
if_then_82:
    mov eax, dword [var_wood]
    mov ebx, dword [var_goldminecostwood]
    cmp eax, ebx
    jg if_then_83
    jmp if_else_83
if_then_83:
    mov eax, dword [var_stone]
    mov ebx, dword [var_goldminecoststone]
    cmp eax, ebx
    jg if_then_84
    jmp if_else_84
if_then_84:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_goldminecostwood]
    pop ebx
    sub ebx, dword [var_goldminecostwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_goldminecoststone]
    pop ebx
    sub ebx, dword [var_goldminecoststone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_goldmine]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_goldmine], eax
    mov eax, dword [var_totalbuildings]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_totalbuildings], eax
    push str_120
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_goldmine]
    push str_121
    call _printf
    add esp, 8
    push 400
    call _boop
    add esp, 4
    mov eax, dword [var_goldminecostwood]
    push eax
    mov eax, 50
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_goldminecostwood], eax
    mov eax, dword [var_goldminecoststone]
    push eax
    mov eax, 50
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_goldminecoststone], eax
    jmp if_end_84
if_else_84:
    push dword [var_goldminecoststone]
    push str_113
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_84:
    jmp if_end_83
if_else_83:
    push dword [var_goldminecostwood]
    push str_115
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_83:
    push 1000
    call _Sleep@4
    jmp if_end_82
if_else_82:
if_end_82:
    mov eax, dword [var_choice]
    mov ebx, 7
    cmp eax, ebx
    je if_then_85
    jmp if_else_85
if_then_85:
    mov eax, dword [var_wood]
    mov ebx, dword [var_warehousecost]
    cmp eax, ebx
    jg if_then_86
    jmp if_else_86
if_then_86:
    mov eax, dword [var_stone]
    mov ebx, dword [var_warehousecost]
    cmp eax, ebx
    jg if_then_87
    jmp if_else_87
if_then_87:
    mov eax, dword [var_gold]
    mov ebx, dword [var_warehousecost]
    cmp eax, ebx
    jg if_then_88
    jmp if_else_88
if_then_88:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_warehousecost]
    pop ebx
    sub ebx, dword [var_warehousecost]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_warehousecost]
    pop ebx
    sub ebx, dword [var_warehousecost]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_warehousecost]
    pop ebx
    sub ebx, dword [var_warehousecost]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_warehouse]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_warehouse], eax
    mov eax, dword [var_totalbuildings]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_totalbuildings], eax
    push str_122
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_warehouse]
    push dword [var_warehouse]
    push str_123
    call _printf
    add esp, 12
    push 400
    call _boop
    add esp, 4
    mov eax, dword [var_warehousecost]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_warehousecost], eax
    jmp if_end_88
if_else_88:
    push dword [var_warehousecost]
    push str_112
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_88:
    jmp if_end_87
if_else_87:
    push dword [var_warehousecost]
    push str_113
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_87:
    jmp if_end_86
if_else_86:
    push dword [var_warehousecost]
    push str_115
    call _printf
    add esp, 8
    push 100
    call _boop
    add esp, 4
if_end_86:
    push 1000
    call _Sleep@4
    jmp if_end_85
if_else_85:
if_end_85:
    mov eax, dword [var_choice]
    mov ebx, 8
    cmp eax, ebx
    je if_then_89
    jmp if_else_89
if_then_89:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_stone]
    pop ebx
    add ebx, dword [var_stone]
    mov eax, ebx
    mov dword [var_totalresources], eax
    mov eax, dword [var_totalresources]
    push eax
    mov eax, dword [var_gold]
    pop ebx
    add ebx, dword [var_gold]
    mov eax, ebx
    mov dword [var_totalresources], eax
    mov eax, dword [var_totalresources]
    mov ebx, dword [var_prestigecost]
    cmp eax, ebx
    jg if_then_90
    jmp if_else_90
if_then_90:
    mov eax, dword [var_prestigelevel]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_prestigelevel], eax
    mov eax, dword [var_prestigebonus]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_prestigebonus], eax
    mov eax, dword [var_prestigecost]
    push eax
    mov eax, 3
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_prestigecost], eax
    mov eax, 0
    mov dword [var_wood], eax
    mov eax, 0
    mov dword [var_stone], eax
    mov eax, 0
    mov dword [var_gold], eax
    mov eax, 1
    mov dword [var_level], eax
    mov eax, 5
    mov dword [var_upgradecost], eax
    mov eax, 0
    mov dword [var_autocollect], eax
    mov eax, 1
    mov dword [var_multiplier], eax
    mov eax, 0
    mov dword [var_turn], eax
    mov eax, 0
    mov dword [var_lumbermill], eax
    mov eax, 0
    mov dword [var_quarry], eax
    mov eax, 0
    mov dword [var_goldmine], eax
    mov eax, 0
    mov dword [var_warehouse], eax
    mov eax, 50
    mov dword [var_lumbermillcostwood], eax
    mov eax, 20
    mov dword [var_lumbermillcoststone], eax
    mov eax, 30
    mov dword [var_quarrycostwood], eax
    mov eax, 60
    mov dword [var_quarrycoststone], eax
    mov eax, 100
    mov dword [var_goldminecostwood], eax
    mov eax, 100
    mov dword [var_goldminecoststone], eax
    mov eax, 200
    mov dword [var_warehousecost], eax
    push dword [var_prestigelevel]
    push str_124
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_prestigebonus]
    push str_125
    call _printf
    add esp, 8
    push 500
    call _boop
    add esp, 4
    jmp if_end_90
if_else_90:
    push dword [var_totalresources]
    push dword [var_prestigecost]
    push str_126
    call _printf
    add esp, 12
    push 100
    call _boop
    add esp, 4
if_end_90:
    push 1500
    call _Sleep@4
    jmp if_end_89
if_else_89:
if_end_89:
    mov eax, dword [var_choice]
    mov ebx, 9
    cmp eax, ebx
    je if_then_91
    jmp if_else_91
if_then_91:
    mov eax, 0
    mov dword [var_shopopen], eax
    push str_127
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 500
    call _Sleep@4
    jmp if_end_91
if_else_91:
if_end_91:
    jmp while_start_67
while_end_67:
    jmp if_end_66
if_else_66:
if_end_66:
    mov eax, dword [var_cmd]
    mov ebx, 5
    cmp eax, ebx
    je if_then_92
    jmp if_else_92
if_then_92:
    call _clearscreen
    push dword [var_achievements]
    push str_128
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_firstcollect]
    mov ebx, 1
    cmp eax, ebx
    je if_then_93
    jmp if_else_93
if_then_93:
    push str_129
    call _printf
    add esp, 4
    jmp if_end_93
if_else_93:
    push str_130
    call _printf
    add esp, 4
if_end_93:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level5]
    mov ebx, 1
    cmp eax, ebx
    je if_then_94
    jmp if_else_94
if_then_94:
    push str_131
    call _printf
    add esp, 4
    jmp if_end_94
if_else_94:
    push str_132
    call _printf
    add esp, 4
if_end_94:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level10]
    mov ebx, 1
    cmp eax, ebx
    je if_then_95
    jmp if_else_95
if_then_95:
    push str_133
    call _printf
    add esp, 4
    jmp if_end_95
if_else_95:
    push str_134
    call _printf
    add esp, 4
if_end_95:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level20]
    mov ebx, 1
    cmp eax, ebx
    je if_then_96
    jmp if_else_96
if_then_96:
    push str_135
    call _printf
    add esp, 4
    jmp if_end_96
if_else_96:
    push str_136
    call _printf
    add esp, 4
if_end_96:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level50]
    mov ebx, 1
    cmp eax, ebx
    je if_then_97
    jmp if_else_97
if_then_97:
    push str_137
    call _printf
    add esp, 4
    jmp if_end_97
if_else_97:
    push str_138
    call _printf
    add esp, 4
if_end_97:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_rich]
    mov ebx, 1
    cmp eax, ebx
    je if_then_98
    jmp if_else_98
if_then_98:
    push str_139
    call _printf
    add esp, 4
    jmp if_end_98
if_else_98:
    push str_140
    call _printf
    add esp, 4
if_end_98:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wealthy]
    mov ebx, 1
    cmp eax, ebx
    je if_then_99
    jmp if_else_99
if_then_99:
    push str_141
    call _printf
    add esp, 4
    jmp if_end_99
if_else_99:
    push str_142
    call _printf
    add esp, 4
if_end_99:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_millionaire]
    mov ebx, 1
    cmp eax, ebx
    je if_then_100
    jmp if_else_100
if_then_100:
    push str_143
    call _printf
    add esp, 4
    jmp if_end_100
if_else_100:
    push str_144
    call _printf
    add esp, 4
if_end_100:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_woodmaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_101
    jmp if_else_101
if_then_101:
    push str_145
    call _printf
    add esp, 4
    jmp if_end_101
if_else_101:
    push str_146
    call _printf
    add esp, 4
if_end_101:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_stonemaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_102
    jmp if_else_102
if_then_102:
    push str_147
    call _printf
    add esp, 4
    jmp if_end_102
if_else_102:
    push str_148
    call _printf
    add esp, 4
if_end_102:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_goldmaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_103
    jmp if_else_103
if_then_103:
    push str_149
    call _printf
    add esp, 4
    jmp if_end_103
if_else_103:
    push str_150
    call _printf
    add esp, 4
if_end_103:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_woodtycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_104
    jmp if_else_104
if_then_104:
    push str_151
    call _printf
    add esp, 4
    jmp if_end_104
if_else_104:
    push str_152
    call _printf
    add esp, 4
if_end_104:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_stonetycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_105
    jmp if_else_105
if_then_105:
    push str_153
    call _printf
    add esp, 4
    jmp if_end_105
if_else_105:
    push str_154
    call _printf
    add esp, 4
if_end_105:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_goldtycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_106
    jmp if_else_106
if_then_106:
    push str_155
    call _printf
    add esp, 4
    jmp if_end_106
if_else_106:
    push str_156
    call _printf
    add esp, 4
if_end_106:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_speedrunner]
    mov ebx, 1
    cmp eax, ebx
    je if_then_107
    jmp if_else_107
if_then_107:
    push str_157
    call _printf
    add esp, 4
    jmp if_end_107
if_else_107:
    push str_158
    call _printf
    add esp, 4
if_end_107:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_shopaholic]
    mov ebx, 1
    cmp eax, ebx
    je if_then_108
    jmp if_else_108
if_then_108:
    push str_159
    call _printf
    add esp, 4
    jmp if_end_108
if_else_108:
    push str_160
    call _printf
    add esp, 4
if_end_108:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_minigamemaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_109
    jmp if_else_109
if_then_109:
    push str_161
    call _printf
    add esp, 4
    jmp if_end_109
if_else_109:
    push str_162
    call _printf
    add esp, 4
if_end_109:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_eventexplorer]
    mov ebx, 1
    cmp eax, ebx
    je if_then_110
    jmp if_else_110
if_then_110:
    push str_163
    call _printf
    add esp, 4
    jmp if_end_110
if_else_110:
    push str_164
    call _printf
    add esp, 4
if_end_110:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_turnveteran]
    mov ebx, 1
    cmp eax, ebx
    je if_then_111
    jmp if_else_111
if_then_111:
    push str_165
    call _printf
    add esp, 4
    jmp if_end_111
if_else_111:
    push str_166
    call _printf
    add esp, 4
if_end_111:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_collectoraddict]
    mov ebx, 1
    cmp eax, ebx
    je if_then_112
    jmp if_else_112
if_then_112:
    push str_167
    call _printf
    add esp, 4
    jmp if_end_112
if_else_112:
    push str_168
    call _printf
    add esp, 4
if_end_112:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_ironfist]
    mov ebx, 1
    cmp eax, ebx
    je if_then_113
    jmp if_else_113
if_then_113:
    push str_169
    call _printf
    add esp, 4
    jmp if_end_113
if_else_113:
    push str_170
    call _printf
    add esp, 4
if_end_113:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_collectorpro]
    mov ebx, 1
    cmp eax, ebx
    je if_then_114
    jmp if_else_114
if_then_114:
    push str_171
    call _printf
    add esp, 4
    jmp if_end_114
if_else_114:
    push str_172
    call _printf
    add esp, 4
if_end_114:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_ultrarich]
    mov ebx, 1
    cmp eax, ebx
    je if_then_115
    jmp if_else_115
if_then_115:
    push str_173
    call _printf
    add esp, 4
    jmp if_end_115
if_else_115:
    push str_174
    call _printf
    add esp, 4
if_end_115:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_grinder]
    mov ebx, 1
    cmp eax, ebx
    je if_then_116
    jmp if_else_116
if_then_116:
    push str_175
    call _printf
    add esp, 4
    jmp if_end_116
if_else_116:
    push str_176
    call _printf
    add esp, 4
if_end_116:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_hoarder]
    mov ebx, 1
    cmp eax, ebx
    je if_then_117
    jmp if_else_117
if_then_117:
    push str_177
    call _printf
    add esp, 4
    jmp if_end_117
if_else_117:
    push str_178
    call _printf
    add esp, 4
if_end_117:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_unstoppable]
    mov ebx, 1
    cmp eax, ebx
    je if_then_118
    jmp if_else_118
if_then_118:
    push str_179
    call _printf
    add esp, 4
    jmp if_end_118
if_else_118:
    push str_180
    call _printf
    add esp, 4
if_end_118:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_eventlegend]
    mov ebx, 1
    cmp eax, ebx
    je if_then_119
    jmp if_else_119
if_then_119:
    push str_181
    call _printf
    add esp, 4
    jmp if_end_119
if_else_119:
    push str_182
    call _printf
    add esp, 4
if_end_119:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_jackpot]
    mov ebx, 1
    cmp eax, ebx
    je if_then_120
    jmp if_else_120
if_then_120:
    push str_183
    call _printf
    add esp, 4
    jmp if_end_120
if_else_120:
    push str_184
    call _printf
    add esp, 4
if_end_120:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_dedicated]
    mov ebx, 1
    cmp eax, ebx
    je if_then_121
    jmp if_else_121
if_then_121:
    push str_185
    call _printf
    add esp, 4
    jmp if_end_121
if_else_121:
    push str_186
    call _printf
    add esp, 4
if_end_121:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_maxedout]
    mov ebx, 1
    cmp eax, ebx
    je if_then_122
    jmp if_else_122
if_then_122:
    push str_187
    call _printf
    add esp, 4
    jmp if_end_122
if_else_122:
    push str_188
    call _printf
    add esp, 4
if_end_122:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_traderachievement]
    mov ebx, 1
    cmp eax, ebx
    je if_then_123
    jmp if_else_123
if_then_123:
    push str_189
    call _printf
    add esp, 4
    jmp if_end_123
if_else_123:
    push str_190
    call _printf
    add esp, 4
if_end_123:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_speculatorachievement]
    mov ebx, 1
    cmp eax, ebx
    je if_then_124
    jmp if_else_124
if_then_124:
    push str_191
    call _printf
    add esp, 4
    jmp if_end_124
if_else_124:
    push str_192
    call _printf
    add esp, 4
if_end_124:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_markettycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_125
    jmp if_else_125
if_then_125:
    push str_193
    call _printf
    add esp, 4
    jmp if_end_125
if_else_125:
    push str_194
    call _printf
    add esp, 4
if_end_125:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_lucky]
    mov ebx, 1
    cmp eax, ebx
    je if_then_126
    jmp if_else_126
if_then_126:
    push str_195
    call _printf
    add esp, 4
    jmp if_end_126
if_else_126:
    push str_196
    call _printf
    add esp, 4
if_end_126:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_buildingachievement]
    mov ebx, 1
    cmp eax, ebx
    je if_then_127
    jmp if_else_127
if_then_127:
    push str_197
    call _printf
    add esp, 4
    jmp if_end_127
if_else_127:
    push str_198
    call _printf
    add esp, 4
if_end_127:
    push str_3
    call _printf
    add esp, 4
    push 3000
    call _Sleep@4
    jmp if_end_92
if_else_92:
if_end_92:
    mov eax, dword [var_cmd]
    mov ebx, 6
    cmp eax, ebx
    je if_then_128
    jmp if_else_128
if_then_128:
    call _clearscreen
    push str_199
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_200
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_201
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_202
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_203
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_204
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_205
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_206
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_207
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_208
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_209
    call _printf
    add esp, 4
    push var_gamechoice
    push scanf_fmt_210
    call _scanf
    add esp, 8
    mov eax, dword [var_gamechoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_129
    jmp if_else_129
if_then_129:
    call _clearscreen
    push str_211
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_212
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_213
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    cmp dword [var_rand_state_130], 0
    jne rand_init_130
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_130], eax
rand_init_130:
    mov eax, dword [var_rand_state_130]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_130]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_130], eax
    mov dword [var_rand_state_130], eax
    mov ecx, 1
    mov ebx, 5
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_secretnumber], eax
    mov eax, dword [var_minigameplays]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigameplays], eax
    push str_214
    call _printf
    add esp, 4
    push var_guess
    push scanf_fmt_215
    call _scanf
    add esp, 8
    mov eax, dword [var_guess]
    mov ebx, dword [var_secretnumber]
    cmp eax, ebx
    je if_then_131
    jmp if_else_131
if_then_131:
    mov eax, dword [var_level]
    push eax
    mov eax, 20
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_minigamewins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigamewins], eax
    push str_216
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push dword [var_reward]
    push str_217
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_131
if_else_131:
    push dword [var_secretnumber]
    push str_218
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_219
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
if_end_131:
    push 1500
    call _Sleep@4
    jmp if_end_129
if_else_129:
if_end_129:
    mov eax, dword [var_gamechoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_132
    jmp if_else_132
if_then_132:
    call _clearscreen
    push str_220
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_221
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_222
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_223
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_minigameplays]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigameplays], eax
    cmp dword [var_rand_state_133], 0
    jne rand_init_133
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_133], eax
rand_init_133:
    mov eax, dword [var_rand_state_133]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_133]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_133], eax
    mov dword [var_rand_state_133], eax
    mov ecx, 1
    mov ebx, 13
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_currentcard], eax
    mov eax, 0
    mov dword [var_streak], eax
    mov eax, 0
    mov dword [var_maxstreak], eax
    push dword [var_currentcard]
    push str_224
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 5000
    call _Sleep@4
    mov eax, 1
    mov dword [var_round], eax
while_start_134:
    mov eax, dword [var_round]
    mov ebx, 6
    cmp eax, ebx
    jge while_end_134
    call _clearscreen
    push str_220
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_round]
    push str_225
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_streak]
    push str_226
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_currentcard]
    push str_227
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_228
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_229
    call _printf
    add esp, 4
    push str_230
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_231
    call _printf
    add esp, 4
    push var_playerguess
    push scanf_fmt_232
    call _scanf
    add esp, 8
    call _clearscreen
    push str_220
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_round]
    push str_225
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_currentcard]
    push str_227
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    cmp dword [var_rand_state_135], 0
    jne rand_init_135
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_135], eax
rand_init_135:
    mov eax, dword [var_rand_state_135]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_135]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_135], eax
    mov dword [var_rand_state_135], eax
    mov ecx, 1
    mov ebx, 13
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_nextcard], eax
    push dword [var_nextcard]
    push str_233
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_correct], eax
    mov eax, dword [var_playerguess]
    mov ebx, 1
    cmp eax, ebx
    je if_then_136
    jmp if_else_136
if_then_136:
    mov eax, dword [var_nextcard]
    mov ebx, dword [var_currentcard]
    cmp eax, ebx
    jg if_then_137
    jmp if_else_137
if_then_137:
    mov eax, 1
    mov dword [var_correct], eax
    jmp if_end_137
if_else_137:
if_end_137:
    jmp if_end_136
if_else_136:
if_end_136:
    mov eax, dword [var_playerguess]
    mov ebx, 2
    cmp eax, ebx
    je if_then_138
    jmp if_else_138
if_then_138:
    mov eax, dword [var_nextcard]
    mov ebx, dword [var_currentcard]
    cmp eax, ebx
    jl if_then_139
    jmp if_else_139
if_then_139:
    mov eax, 1
    mov dword [var_correct], eax
    jmp if_end_139
if_else_139:
if_end_139:
    jmp if_end_138
if_else_138:
if_end_138:
    mov eax, dword [var_nextcard]
    mov ebx, dword [var_currentcard]
    cmp eax, ebx
    je if_then_140
    jmp if_else_140
if_then_140:
    push str_234
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_140
if_else_140:
    mov eax, dword [var_correct]
    mov ebx, 1
    cmp eax, ebx
    je if_then_141
    jmp if_else_141
if_then_141:
    mov eax, dword [var_streak]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_streak], eax
    mov eax, dword [var_streak]
    mov ebx, dword [var_maxstreak]
    cmp eax, ebx
    jg if_then_142
    jmp if_else_142
if_then_142:
    mov eax, dword [var_streak]
    mov dword [var_maxstreak], eax
    jmp if_end_142
if_else_142:
if_end_142:
    push dword [var_streak]
    push str_235
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_141
if_else_141:
    push str_236
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_streak], eax
if_end_141:
if_end_140:
    mov eax, dword [var_nextcard]
    mov dword [var_currentcard], eax
    mov eax, dword [var_round]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_round], eax
    mov eax, dword [var_round]
    mov ebx, 6
    cmp eax, ebx
    jl if_then_143
    jmp if_else_143
if_then_143:
    push str_3
    call _printf
    add esp, 4
    push str_237
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_238
    call _printf
    add esp, 4
    push str_239
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_231
    call _printf
    add esp, 4
    push var_continue
    push scanf_fmt_240
    call _scanf
    add esp, 8
    mov eax, dword [var_continue]
    mov ebx, 2
    cmp eax, ebx
    je if_then_144
    jmp if_else_144
if_then_144:
    mov eax, 6
    mov dword [var_round], eax
    jmp if_end_144
if_else_144:
if_end_144:
    jmp if_end_143
if_else_143:
if_end_143:
    jmp while_start_134
while_end_134:
    call _clearscreen
    push str_241
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_maxstreak]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_145
    jmp if_else_145
if_then_145:
    mov eax, dword [var_level]
    push eax
    mov eax, 10
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_maxstreak]
    pop ebx
    imul ebx, dword [var_maxstreak]
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_minigamewins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigamewins], eax
    push dword [var_maxstreak]
    push str_242
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_maxstreak]
    push str_243
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_217
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_145
if_else_145:
    push str_244
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_245
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
if_end_145:
    push str_3
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_132
if_else_132:
if_end_132:
    mov eax, dword [var_gamechoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_146
    jmp if_else_146
if_then_146:
    call _clearscreen
    push str_246
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_247
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_248
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_minigameplays]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigameplays], eax
    mov eax, 0
    mov dword [var_correctanswers], eax
    mov eax, 5
    mov dword [var_totalquestions], eax
    mov eax, 10
    mov dword [var_maxnumber], eax
    mov eax, dword [var_level]
    mov ebx, 10
    cmp eax, ebx
    jg if_then_147
    jmp if_else_147
if_then_147:
    mov eax, 25
    mov dword [var_maxnumber], eax
    jmp if_end_147
if_else_147:
if_end_147:
    mov eax, dword [var_level]
    mov ebx, 25
    cmp eax, ebx
    jg if_then_148
    jmp if_else_148
if_then_148:
    mov eax, 50
    mov dword [var_maxnumber], eax
    jmp if_end_148
if_else_148:
if_end_148:
    mov eax, dword [var_level]
    mov ebx, 50
    cmp eax, ebx
    jg if_then_149
    jmp if_else_149
if_then_149:
    mov eax, 100
    mov dword [var_maxnumber], eax
    jmp if_end_149
if_else_149:
if_end_149:
    mov eax, 1
    mov dword [var_question], eax
while_start_150:
    mov eax, dword [var_question]
    mov ebx, 6
    cmp eax, ebx
    jge while_end_150
    push dword [var_totalquestions]
    push dword [var_question]
    push str_249
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    cmp dword [var_rand_state_151], 0
    jne rand_init_151
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_151], eax
rand_init_151:
    mov eax, dword [var_rand_state_151]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_151]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_151], eax
    mov dword [var_rand_state_151], eax
    mov ecx, 1
    mov ebx, dword [var_maxnumber]
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_num1], eax
    cmp dword [var_rand_state_152], 0
    jne rand_init_152
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_152], eax
rand_init_152:
    mov eax, dword [var_rand_state_152]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_152]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_152], eax
    mov dword [var_rand_state_152], eax
    mov ecx, 1
    mov ebx, dword [var_maxnumber]
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_num2], eax
    cmp dword [var_rand_state_153], 0
    jne rand_init_153
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_153], eax
rand_init_153:
    mov eax, dword [var_rand_state_153]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_153]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_153], eax
    mov dword [var_rand_state_153], eax
    mov ecx, 1
    mov ebx, 4
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_operation], eax
    mov eax, dword [var_operation]
    mov ebx, 4
    cmp eax, ebx
    je if_then_154
    jmp if_else_154
if_then_154:
    cmp dword [var_rand_state_155], 0
    jne rand_init_155
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_155], eax
rand_init_155:
    mov eax, dword [var_rand_state_155]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_155]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_155], eax
    mov dword [var_rand_state_155], eax
    mov ecx, 1
    mov ebx, 10
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_temp123124], eax
    mov eax, dword [var_num2]
    push eax
    mov eax, dword [var_temp123124]
    pop ebx
    imul ebx, dword [var_temp123124]
    mov eax, ebx
    mov dword [var_num1], eax
    jmp if_end_154
if_else_154:
if_end_154:
    mov eax, 0
    mov dword [var_correctanswer], eax
    mov eax, dword [var_operation]
    mov ebx, 1
    cmp eax, ebx
    je if_then_156
    jmp if_else_156
if_then_156:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    add ebx, dword [var_num2]
    mov eax, ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_250
    call _printf
    add esp, 12
    jmp if_end_156
if_else_156:
if_end_156:
    mov eax, dword [var_operation]
    mov ebx, 2
    cmp eax, ebx
    je if_then_157
    jmp if_else_157
if_then_157:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    sub ebx, dword [var_num2]
    mov eax, ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_251
    call _printf
    add esp, 12
    jmp if_end_157
if_else_157:
if_end_157:
    mov eax, dword [var_operation]
    mov ebx, 3
    cmp eax, ebx
    je if_then_158
    jmp if_else_158
if_then_158:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    imul ebx, dword [var_num2]
    mov eax, ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_252
    call _printf
    add esp, 12
    jmp if_end_158
if_else_158:
if_end_158:
    mov eax, dword [var_operation]
    mov ebx, 4
    cmp eax, ebx
    je if_then_159
    jmp if_else_159
if_then_159:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    mov eax, ebx
    mov ebx, dword [var_num2]
    cdq
    idiv ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_253
    call _printf
    add esp, 12
    jmp if_end_159
if_else_159:
if_end_159:
    push str_3
    call _printf
    add esp, 4
    push str_254
    call _printf
    add esp, 4
    push var_playeranswer
    push scanf_fmt_255
    call _scanf
    add esp, 8
    mov eax, dword [var_playeranswer]
    mov ebx, dword [var_correctanswer]
    cmp eax, ebx
    je if_then_160
    jmp if_else_160
if_then_160:
    push str_256
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_correctanswers]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_correctanswers], eax
    push 300
    call _boop
    add esp, 4
    jmp if_end_160
if_else_160:
    push dword [var_correctanswer]
    push str_257
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
if_end_160:
    mov eax, dword [var_question]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_question], eax
    push 500
    call _Sleep@4
    jmp while_start_150
while_end_150:
    mov eax, dword [var_correctanswers]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_161
    jmp if_else_161
if_then_161:
    mov eax, dword [var_level]
    push eax
    mov eax, 8
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_correctanswers]
    pop ebx
    imul ebx, dword [var_correctanswers]
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_minigamewins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigamewins], eax
    push dword [var_totalquestions]
    push dword [var_correctanswers]
    push str_258
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_217
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_161
if_else_161:
    push dword [var_totalquestions]
    push str_259
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_260
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
if_end_161:
    push 1500
    call _Sleep@4
    jmp if_end_146
if_else_146:
if_end_146:
    mov eax, dword [var_gamechoice]
    mov ebx, 4
    cmp eax, ebx
    je if_then_162
    jmp if_else_162
if_then_162:
    call _clearscreen
    push str_261
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_262
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_263
    call _printf
    add esp, 4
    push str_264
    call _printf
    add esp, 4
    push str_265
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_266
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_267
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_minigameplays]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigameplays], eax
    mov eax, 0
    mov dword [var_playerwins], eax
    mov eax, 0
    mov dword [var_botwins], eax
    mov eax, 1
    mov dword [var_round], eax
while_start_163:
    mov eax, dword [var_round]
    mov ebx, 4
    cmp eax, ebx
    jge while_end_163
    push dword [var_round]
    push str_268
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_269
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_270
    call _printf
    add esp, 4
    push var_rpschoice
    push scanf_fmt_271
    call _scanf
    add esp, 8
    mov eax, dword [var_rpschoice]
    mov ebx, 1
    cmp eax, ebx
    jl if_then_164
    jmp if_else_164
if_then_164:
    mov eax, 1
    mov dword [var_rpschoice], eax
    jmp if_end_164
if_else_164:
if_end_164:
    mov eax, dword [var_rpschoice]
    mov ebx, 3
    cmp eax, ebx
    jg if_then_165
    jmp if_else_165
if_then_165:
    mov eax, 3
    mov dword [var_rpschoice], eax
    jmp if_end_165
if_else_165:
if_end_165:
    cmp dword [var_rand_state_166], 0
    jne rand_init_166
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_166], eax
rand_init_166:
    mov eax, dword [var_rand_state_166]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_166]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_166], eax
    mov dword [var_rand_state_166], eax
    mov ecx, 1
    mov ebx, 3
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_botchoice], eax
    push str_272
    call _printf
    add esp, 4
    mov eax, dword [var_rpschoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_167
    jmp if_else_167
if_then_167:
    push str_273
    call _printf
    add esp, 4
    jmp if_end_167
if_else_167:
if_end_167:
    mov eax, dword [var_rpschoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_168
    jmp if_else_168
if_then_168:
    push str_274
    call _printf
    add esp, 4
    jmp if_end_168
if_else_168:
if_end_168:
    mov eax, dword [var_rpschoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_169
    jmp if_else_169
if_then_169:
    push str_275
    call _printf
    add esp, 4
    jmp if_end_169
if_else_169:
if_end_169:
    push str_3
    call _printf
    add esp, 4
    push str_276
    call _printf
    add esp, 4
    mov eax, dword [var_botchoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_170
    jmp if_else_170
if_then_170:
    push str_273
    call _printf
    add esp, 4
    jmp if_end_170
if_else_170:
if_end_170:
    mov eax, dword [var_botchoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_171
    jmp if_else_171
if_then_171:
    push str_274
    call _printf
    add esp, 4
    jmp if_end_171
if_else_171:
if_end_171:
    mov eax, dword [var_botchoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_172
    jmp if_else_172
if_then_172:
    push str_275
    call _printf
    add esp, 4
    jmp if_end_172
if_else_172:
if_end_172:
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_rpschoice]
    mov ebx, dword [var_botchoice]
    cmp eax, ebx
    je if_then_173
    jmp if_else_173
if_then_173:
    push str_277
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_278
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
    jmp if_end_173
if_else_173:
    mov eax, 0
    mov dword [var_playerwinsround], eax
    mov eax, dword [var_rpschoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_174
    jmp if_else_174
if_then_174:
    mov eax, dword [var_botchoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_175
    jmp if_else_175
if_then_175:
    mov eax, 1
    mov dword [var_playerwinsround], eax
    jmp if_end_175
if_else_175:
if_end_175:
    jmp if_end_174
if_else_174:
if_end_174:
    mov eax, dword [var_rpschoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_176
    jmp if_else_176
if_then_176:
    mov eax, dword [var_botchoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_177
    jmp if_else_177
if_then_177:
    mov eax, 1
    mov dword [var_playerwinsround], eax
    jmp if_end_177
if_else_177:
if_end_177:
    jmp if_end_176
if_else_176:
if_end_176:
    mov eax, dword [var_rpschoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_178
    jmp if_else_178
if_then_178:
    mov eax, dword [var_botchoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_179
    jmp if_else_179
if_then_179:
    mov eax, 1
    mov dword [var_playerwinsround], eax
    jmp if_end_179
if_else_179:
if_end_179:
    jmp if_end_178
if_else_178:
if_end_178:
    mov eax, dword [var_playerwinsround]
    mov ebx, 1
    cmp eax, ebx
    je if_then_180
    jmp if_else_180
if_then_180:
    mov eax, dword [var_playerwins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_playerwins], eax
    push str_279
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_180
if_else_180:
    mov eax, dword [var_botwins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_botwins], eax
    push str_280
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
if_end_180:
    mov eax, dword [var_round]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_round], eax
    push 800
    call _Sleep@4
if_end_173:
    push dword [var_botwins]
    push dword [var_playerwins]
    push str_281
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 500
    call _Sleep@4
    jmp while_start_163
while_end_163:
    call _clearscreen
    push str_282
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_botwins]
    push dword [var_playerwins]
    push str_283
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_playerwins]
    mov ebx, dword [var_botwins]
    cmp eax, ebx
    jg if_then_181
    jmp if_else_181
if_then_181:
    mov eax, dword [var_minigamewins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigamewins], eax
    mov eax, dword [var_playerwins]
    mov ebx, 3
    cmp eax, ebx
    je if_then_182
    jmp if_else_182
if_then_182:
    mov eax, dword [var_botwins]
    mov ebx, 0
    cmp eax, ebx
    je if_then_183
    jmp if_else_183
if_then_183:
    push str_284
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    push eax
    mov eax, 50
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_reward]
    push str_285
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 400
    call _boop
    add esp, 4
    push 500
    call _boop
    add esp, 4
    jmp if_end_183
if_else_183:
    push str_286
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    push eax
    mov eax, 30
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_reward]
    push str_217
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 300
    call _boop
    add esp, 4
if_end_183:
    jmp if_end_182
if_else_182:
    push str_287
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    push eax
    mov eax, 20
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_reward]
    push str_217
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
if_end_182:
    jmp if_end_181
if_else_181:
    mov eax, dword [var_playerwins]
    mov ebx, dword [var_botwins]
    cmp eax, ebx
    je if_then_184
    jmp if_else_184
if_then_184:
    push str_288
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    push eax
    mov eax, 5
    pop ebx
    imul ebx, eax
    mov eax, ebx
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_reward]
    push str_289
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 200
    call _boop
    add esp, 4
    jmp if_end_184
if_else_184:
    push str_290
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_219
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_level]
    mov ebx, 1
    cmp eax, ebx
    jg if_then_185
    jmp if_else_185
if_then_185:
    mov eax, dword [var_level]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_reward]
    push str_291
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_185
if_else_185:
if_end_185:
    push 100
    call _boop
    add esp, 4
if_end_184:
if_end_181:
    push str_3
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_162
if_else_162:
if_end_162:
    mov eax, dword [var_gamechoice]
    mov ebx, 5
    cmp eax, ebx
    je if_then_186
    jmp if_else_186
if_then_186:
    call _clearscreen
    push str_292
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_293
    call _printf
    add esp, 4
    push str_294
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_295
    call _printf
    add esp, 4
    push var_betamount
    push scanf_fmt_296
    call _scanf
    add esp, 8
    mov eax, dword [var_betamount]
    mov ebx, 10
    cmp eax, ebx
    jl if_then_187
    jmp if_else_187
if_then_187:
    mov eax, 10
    mov dword [var_betamount], eax
    jmp if_end_187
if_else_187:
if_end_187:
    mov eax, 0
    mov dword [var_canbet], eax
    mov eax, dword [var_wood]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_188
    jmp if_else_188
if_then_188:
    mov eax, dword [var_stone]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_189
    jmp if_else_189
if_then_189:
    mov eax, dword [var_gold]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_190
    jmp if_else_190
if_then_190:
    mov eax, 1
    mov dword [var_canbet], eax
    jmp if_end_190
if_else_190:
if_end_190:
    jmp if_end_189
if_else_189:
if_end_189:
    jmp if_end_188
if_else_188:
if_end_188:
    mov eax, dword [var_canbet]
    mov ebx, 1
    cmp eax, ebx
    je if_then_191
    jmp if_else_191
if_then_191:
    push str_297
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 500
    call _Sleep@4
    cmp dword [var_rand_state_192], 0
    jne rand_init_192
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_192], eax
rand_init_192:
    mov eax, dword [var_rand_state_192]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_192]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_192], eax
    mov dword [var_rand_state_192], eax
    mov ecx, 1
    mov ebx, 6
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_die1], eax
    cmp dword [var_rand_state_193], 0
    jne rand_init_193
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_193], eax
rand_init_193:
    mov eax, dword [var_rand_state_193]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_193]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_193], eax
    mov dword [var_rand_state_193], eax
    mov ecx, 1
    mov ebx, 6
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_die2], eax
    mov eax, dword [var_die1]
    push eax
    mov eax, dword [var_die2]
    pop ebx
    add ebx, dword [var_die2]
    mov eax, ebx
    mov dword [var_playertotal], eax
    push dword [var_playertotal]
    push dword [var_die2]
    push dword [var_die1]
    push str_298
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
    push str_299
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 500
    call _Sleep@4
    cmp dword [var_rand_state_194], 0
    jne rand_init_194
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_194], eax
rand_init_194:
    mov eax, dword [var_rand_state_194]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_194]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_194], eax
    mov dword [var_rand_state_194], eax
    mov ecx, 1
    mov ebx, 6
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_compdie1], eax
    cmp dword [var_rand_state_195], 0
    jne rand_init_195
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_195], eax
rand_init_195:
    mov eax, dword [var_rand_state_195]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_195]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_195], eax
    mov dword [var_rand_state_195], eax
    mov ecx, 1
    mov ebx, 6
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_compdie2], eax
    mov eax, dword [var_compdie1]
    push eax
    mov eax, dword [var_compdie2]
    pop ebx
    add ebx, dword [var_compdie2]
    mov eax, ebx
    mov dword [var_comptotal], eax
    push dword [var_comptotal]
    push dword [var_compdie2]
    push dword [var_compdie1]
    push str_300
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
    mov eax, 0
    mov dword [var_playerdoubles], eax
    mov eax, 0
    mov dword [var_compdoubles], eax
    mov eax, dword [var_die1]
    mov ebx, dword [var_die2]
    cmp eax, ebx
    je if_then_196
    jmp if_else_196
if_then_196:
    mov eax, 1
    mov dword [var_playerdoubles], eax
    push str_301
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_196
if_else_196:
if_end_196:
    mov eax, dword [var_compdie1]
    mov ebx, dword [var_compdie2]
    cmp eax, ebx
    je if_then_197
    jmp if_else_197
if_then_197:
    mov eax, 1
    mov dword [var_compdoubles], eax
    push str_302
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_197
if_else_197:
if_end_197:
    mov eax, dword [var_playertotal]
    mov ebx, dword [var_comptotal]
    cmp eax, ebx
    jg if_then_198
    jmp if_else_198
if_then_198:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_playerdoubles]
    mov ebx, 1
    cmp eax, ebx
    je if_then_199
    jmp if_else_199
if_then_199:
    mov eax, dword [var_reward]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_303
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_199
if_else_199:
if_end_199:
    mov eax, dword [var_reward]
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_minigamewins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigamewins], eax
    push str_304
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_305
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 400
    call _boop
    add esp, 4
    push 500
    call _boop
    add esp, 4
    jmp if_end_198
if_else_198:
    mov eax, dword [var_playertotal]
    mov ebx, dword [var_comptotal]
    cmp eax, ebx
    je if_then_200
    jmp if_else_200
if_then_200:
    push str_306
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_307
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_200
if_else_200:
    push str_308
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_compdoubles]
    mov ebx, 1
    cmp eax, ebx
    je if_then_201
    jmp if_else_201
if_then_201:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_loss], eax
    push str_309
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_201
if_else_201:
    mov eax, dword [var_betamount]
    mov dword [var_loss], eax
if_end_201:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_loss]
    pop ebx
    sub ebx, dword [var_loss]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_loss]
    pop ebx
    sub ebx, dword [var_loss]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_loss]
    pop ebx
    sub ebx, dword [var_loss]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_wood]
    mov ebx, 0
    cmp eax, ebx
    jl if_then_202
    jmp if_else_202
if_then_202:
    mov eax, 0
    mov dword [var_wood], eax
    jmp if_end_202
if_else_202:
if_end_202:
    mov eax, dword [var_stone]
    mov ebx, 0
    cmp eax, ebx
    jl if_then_203
    jmp if_else_203
if_then_203:
    mov eax, 0
    mov dword [var_stone], eax
    jmp if_end_203
if_else_203:
if_end_203:
    mov eax, dword [var_gold]
    mov ebx, 0
    cmp eax, ebx
    jl if_then_204
    jmp if_else_204
if_then_204:
    mov eax, 0
    mov dword [var_gold], eax
    jmp if_end_204
if_else_204:
if_end_204:
    push dword [var_loss]
    push str_310
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
if_end_200:
if_end_198:
    jmp if_end_191
if_else_191:
    push str_311
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_betamount]
    push str_312
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
if_end_191:
    push 1500
    call _Sleep@4
    jmp if_end_186
if_else_186:
if_end_186:
    mov eax, dword [var_gamechoice]
    mov ebx, 6
    cmp eax, ebx
    je if_then_205
    jmp if_else_205
if_then_205:
    push str_313
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_314
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_315
    call _printf
    add esp, 4
    push var_betamount
    push scanf_fmt_316
    call _scanf
    add esp, 8
    mov eax, dword [var_wood]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_206
    jmp if_else_206
if_then_206:
    mov eax, dword [var_stone]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_207
    jmp if_else_207
if_then_207:
    mov eax, dword [var_gold]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_208
    jmp if_else_208
if_then_208:
    push str_317
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_318
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_319
    call _printf
    add esp, 4
    push var_choice
    push scanf_fmt_320
    call _scanf
    add esp, 8
    cmp dword [var_rand_state_209], 0
    jne rand_init_209
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_209], eax
rand_init_209:
    mov eax, dword [var_rand_state_209]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_209]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_209], eax
    mov dword [var_rand_state_209], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_coin], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_coin]
    mov ebx, 1
    cmp eax, ebx
    je if_then_210
    jmp if_else_210
if_then_210:
    push str_321
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_210
if_else_210:
    push str_322
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
if_end_210:
    mov eax, dword [var_choice]
    mov ebx, dword [var_coin]
    cmp eax, ebx
    je if_then_211
    jmp if_else_211
if_then_211:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_reward]
    push str_323
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_211
if_else_211:
    push str_324
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
if_end_211:
    jmp if_end_208
if_else_208:
if_end_208:
    jmp if_end_207
if_else_207:
if_end_207:
    jmp if_end_206
if_else_206:
if_end_206:
    push 1500
    call _Sleep@4
    jmp if_end_205
if_else_205:
if_end_205:
    mov eax, dword [var_gamechoice]
    mov ebx, 7
    cmp eax, ebx
    je if_then_212
    jmp if_else_212
if_then_212:
    push str_325
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_326
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_score], eax
    cmp dword [var_rand_state_213], 0
    jne rand_init_213
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_213], eax
rand_init_213:
    mov eax, dword [var_rand_state_213]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_213]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_213], eax
    mov dword [var_rand_state_213], eax
    mov ecx, 1
    mov ebx, 10
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_currentnum], eax
    push dword [var_currentnum]
    push str_327
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, 1
    mov dword [var_round], eax
while_start_214:
    mov eax, dword [var_round]
    mov ebx, 6
    cmp eax, ebx
    jge while_end_214
    push dword [var_round]
    push str_268
    call _printf
    add esp, 8
    push dword [var_currentnum]
    push str_328
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_329
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_330
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_331
    call _printf
    add esp, 4
    push var_guess
    push scanf_fmt_332
    call _scanf
    add esp, 8
    cmp dword [var_rand_state_215], 0
    jne rand_init_215
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_215], eax
rand_init_215:
    mov eax, dword [var_rand_state_215]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_215]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_215], eax
    mov dword [var_rand_state_215], eax
    mov ecx, 1
    mov ebx, 10
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_nextnum], eax
    push dword [var_nextnum]
    push str_333
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_correct], eax
    mov eax, dword [var_guess]
    mov ebx, 1
    cmp eax, ebx
    je if_then_216
    jmp if_else_216
if_then_216:
    mov eax, dword [var_nextnum]
    mov ebx, dword [var_currentnum]
    cmp eax, ebx
    jg if_then_217
    jmp if_else_217
if_then_217:
    mov eax, 1
    mov dword [var_correct], eax
    jmp if_end_217
if_else_217:
if_end_217:
    jmp if_end_216
if_else_216:
if_end_216:
    mov eax, dword [var_guess]
    mov ebx, 2
    cmp eax, ebx
    je if_then_218
    jmp if_else_218
if_then_218:
    mov eax, dword [var_nextnum]
    mov ebx, dword [var_currentnum]
    cmp eax, ebx
    jl if_then_219
    jmp if_else_219
if_then_219:
    mov eax, 1
    mov dword [var_correct], eax
    jmp if_end_219
if_else_219:
if_end_219:
    jmp if_end_218
if_else_218:
if_end_218:
    mov eax, dword [var_correct]
    mov ebx, 1
    cmp eax, ebx
    je if_then_220
    jmp if_else_220
if_then_220:
    push str_256
    call _printf
    add esp, 4
    mov eax, dword [var_score]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_score], eax
    push str_3
    call _printf
    add esp, 4
    jmp if_end_220
if_else_220:
    push str_334
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
if_end_220:
    mov eax, dword [var_nextnum]
    mov dword [var_currentnum], eax
    mov eax, dword [var_round]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_round], eax
    push 800
    call _Sleep@4
    jmp while_start_214
while_end_214:
    mov eax, dword [var_score]
    push eax
    mov eax, dword [var_level]
    pop ebx
    imul ebx, dword [var_level]
    mov eax, ebx
    push eax
    mov eax, 5
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_score]
    push str_335
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_336
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_212
if_else_212:
if_end_212:
    mov eax, dword [var_gamechoice]
    mov ebx, 8
    cmp eax, ebx
    je if_then_221
    jmp if_else_221
if_then_221:
    call _clearscreen
    push str_337
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_338
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_339
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_340
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_341
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_minigameplays]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigameplays], eax
    push str_342
    call _printf
    add esp, 4
    push var_betamount
    push scanf_fmt_343
    call _scanf
    add esp, 8
    mov eax, dword [var_betamount]
    mov ebx, 10
    cmp eax, ebx
    jl if_then_222
    jmp if_else_222
if_then_222:
    mov eax, 10
    mov dword [var_betamount], eax
    push str_344
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_222
if_else_222:
if_end_222:
    mov eax, dword [var_betamount]
    mov ebx, 100
    cmp eax, ebx
    jg if_then_223
    jmp if_else_223
if_then_223:
    mov eax, 100
    mov dword [var_betamount], eax
    push str_345
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_223
if_else_223:
if_end_223:
    mov eax, 0
    mov dword [var_canplay], eax
    mov eax, dword [var_wood]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_224
    jmp if_else_224
if_then_224:
    mov eax, dword [var_stone]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_225
    jmp if_else_225
if_then_225:
    mov eax, dword [var_gold]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_226
    jmp if_else_226
if_then_226:
    mov eax, 1
    mov dword [var_canplay], eax
    jmp if_end_226
if_else_226:
if_end_226:
    jmp if_end_225
if_else_225:
if_end_225:
    jmp if_end_224
if_else_224:
if_end_224:
    mov eax, dword [var_canplay]
    mov ebx, 0
    cmp eax, ebx
    je if_then_227
    jmp if_else_227
if_then_227:
    push dword [var_betamount]
    push str_346
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_227
if_else_227:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_betamount]
    push str_347
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
    push str_348
    call _printf
    add esp, 4
    push 200
    call _boop
    add esp, 4
    push 300
    call _Sleep@4
    push str_349
    call _printf
    add esp, 4
    push 300
    call _Sleep@4
    push str_349
    call _printf
    add esp, 4
    push 300
    call _Sleep@4
    push str_349
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 300
    call _Sleep@4
    cmp dword [var_rand_state_228], 0
    jne rand_init_228
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_228], eax
rand_init_228:
    mov eax, dword [var_rand_state_228]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_228]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_228], eax
    mov dword [var_rand_state_228], eax
    mov ecx, 1
    mov ebx, 4
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_reel1], eax
    cmp dword [var_rand_state_229], 0
    jne rand_init_229
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_229], eax
rand_init_229:
    mov eax, dword [var_rand_state_229]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_229]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_229], eax
    mov dword [var_rand_state_229], eax
    mov ecx, 1
    mov ebx, 4
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_reel2], eax
    cmp dword [var_rand_state_230], 0
    jne rand_init_230
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_230], eax
rand_init_230:
    mov eax, dword [var_rand_state_230]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_230]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_230], eax
    mov dword [var_rand_state_230], eax
    mov ecx, 1
    mov ebx, 4
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_reel3], eax
    call _clearscreen
    push str_350
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov esi, temp_str_351
    mov edi, var_symbol1
    call _copy_string
    mov esi, temp_str_352
    mov edi, var_symbolname1
    call _copy_string
    mov eax, dword [var_reel1]
    mov ebx, 1
    cmp eax, ebx
    je if_then_231
    jmp if_else_231
if_then_231:
    mov esi, temp_str_353
    mov edi, var_symbol1
    call _copy_string
    mov esi, temp_str_354
    mov edi, var_symbolname1
    call _copy_string
    jmp if_end_231
if_else_231:
if_end_231:
    mov eax, dword [var_reel1]
    mov ebx, 2
    cmp eax, ebx
    je if_then_232
    jmp if_else_232
if_then_232:
    mov esi, temp_str_355
    mov edi, var_symbol1
    call _copy_string
    mov esi, temp_str_356
    mov edi, var_symbolname1
    call _copy_string
    jmp if_end_232
if_else_232:
if_end_232:
    mov eax, dword [var_reel1]
    mov ebx, 3
    cmp eax, ebx
    je if_then_233
    jmp if_else_233
if_then_233:
    mov esi, temp_str_357
    mov edi, var_symbol1
    call _copy_string
    mov esi, temp_str_358
    mov edi, var_symbolname1
    call _copy_string
    jmp if_end_233
if_else_233:
if_end_233:
    mov eax, dword [var_reel1]
    mov ebx, 4
    cmp eax, ebx
    je if_then_234
    jmp if_else_234
if_then_234:
    mov esi, temp_str_359
    mov edi, var_symbol1
    call _copy_string
    mov esi, temp_str_360
    mov edi, var_symbolname1
    call _copy_string
    jmp if_end_234
if_else_234:
if_end_234:
    mov esi, temp_str_361
    mov edi, var_symbol2
    call _copy_string
    mov esi, temp_str_362
    mov edi, var_symbolname2
    call _copy_string
    mov eax, dword [var_reel2]
    mov ebx, 1
    cmp eax, ebx
    je if_then_235
    jmp if_else_235
if_then_235:
    mov esi, temp_str_363
    mov edi, var_symbol2
    call _copy_string
    mov esi, temp_str_364
    mov edi, var_symbolname2
    call _copy_string
    jmp if_end_235
if_else_235:
if_end_235:
    mov eax, dword [var_reel2]
    mov ebx, 2
    cmp eax, ebx
    je if_then_236
    jmp if_else_236
if_then_236:
    mov esi, temp_str_365
    mov edi, var_symbol2
    call _copy_string
    mov esi, temp_str_366
    mov edi, var_symbolname2
    call _copy_string
    jmp if_end_236
if_else_236:
if_end_236:
    mov eax, dword [var_reel2]
    mov ebx, 3
    cmp eax, ebx
    je if_then_237
    jmp if_else_237
if_then_237:
    mov esi, temp_str_367
    mov edi, var_symbol2
    call _copy_string
    mov esi, temp_str_368
    mov edi, var_symbolname2
    call _copy_string
    jmp if_end_237
if_else_237:
if_end_237:
    mov eax, dword [var_reel2]
    mov ebx, 4
    cmp eax, ebx
    je if_then_238
    jmp if_else_238
if_then_238:
    mov esi, temp_str_369
    mov edi, var_symbol2
    call _copy_string
    mov esi, temp_str_370
    mov edi, var_symbolname2
    call _copy_string
    jmp if_end_238
if_else_238:
if_end_238:
    mov esi, temp_str_371
    mov edi, var_symbol3
    call _copy_string
    mov esi, temp_str_372
    mov edi, var_symbolname3
    call _copy_string
    mov eax, dword [var_reel3]
    mov ebx, 1
    cmp eax, ebx
    je if_then_239
    jmp if_else_239
if_then_239:
    mov esi, temp_str_373
    mov edi, var_symbol3
    call _copy_string
    mov esi, temp_str_374
    mov edi, var_symbolname3
    call _copy_string
    jmp if_end_239
if_else_239:
if_end_239:
    mov eax, dword [var_reel3]
    mov ebx, 2
    cmp eax, ebx
    je if_then_240
    jmp if_else_240
if_then_240:
    mov esi, temp_str_375
    mov edi, var_symbol3
    call _copy_string
    mov esi, temp_str_376
    mov edi, var_symbolname3
    call _copy_string
    jmp if_end_240
if_else_240:
if_end_240:
    mov eax, dword [var_reel3]
    mov ebx, 3
    cmp eax, ebx
    je if_then_241
    jmp if_else_241
if_then_241:
    mov esi, temp_str_377
    mov edi, var_symbol3
    call _copy_string
    mov esi, temp_str_378
    mov edi, var_symbolname3
    call _copy_string
    jmp if_end_241
if_else_241:
if_end_241:
    mov eax, dword [var_reel3]
    mov ebx, 4
    cmp eax, ebx
    je if_then_242
    jmp if_else_242
if_then_242:
    mov esi, temp_str_379
    mov edi, var_symbol3
    call _copy_string
    mov esi, temp_str_380
    mov edi, var_symbolname3
    call _copy_string
    jmp if_end_242
if_else_242:
if_end_242:
    push str_381
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 400
    call _Sleep@4
    push 300
    call _boop
    add esp, 4
    push var_symbol1
    push str_382
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 400
    call _Sleep@4
    push 350
    call _boop
    add esp, 4
    push var_symbol2
    push var_symbol1
    push str_383
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 400
    call _Sleep@4
    push 400
    call _boop
    add esp, 4
    push var_symbol3
    push var_symbol2
    push var_symbol1
    push str_384
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push var_symbolname3
    push var_symbolname2
    push var_symbolname1
    push str_385
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_reward], eax
    mov eax, 0
    mov dword [var_wintype], eax
    mov eax, dword [var_reel1]
    mov ebx, dword [var_reel2]
    cmp eax, ebx
    je if_then_243
    jmp if_else_243
if_then_243:
    mov eax, dword [var_reel2]
    mov ebx, dword [var_reel3]
    cmp eax, ebx
    je if_then_244
    jmp if_else_244
if_then_244:
    mov eax, 2
    mov dword [var_wintype], eax
    mov eax, dword [var_reel1]
    mov ebx, 1
    cmp eax, ebx
    je if_then_245
    jmp if_else_245
if_then_245:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 20
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_386
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 500
    call _boop
    add esp, 4
    push 600
    call _boop
    add esp, 4
    push 700
    call _boop
    add esp, 4
    jmp if_end_245
if_else_245:
if_end_245:
    mov eax, dword [var_reel1]
    mov ebx, 2
    cmp eax, ebx
    je if_then_246
    jmp if_else_246
if_then_246:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 8
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_387
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 400
    call _boop
    add esp, 4
    push 500
    call _boop
    add esp, 4
    jmp if_end_246
if_else_246:
if_end_246:
    mov eax, dword [var_reel1]
    mov ebx, 3
    cmp eax, ebx
    je if_then_247
    jmp if_else_247
if_then_247:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 5
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_388
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 400
    call _boop
    add esp, 4
    jmp if_end_247
if_else_247:
if_end_247:
    mov eax, dword [var_reel1]
    mov ebx, 4
    cmp eax, ebx
    je if_then_248
    jmp if_else_248
if_then_248:
    mov eax, dword [var_betamount]
    push eax
    mov eax, 3
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_389
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_248
if_else_248:
if_end_248:
    jmp if_end_244
if_else_244:
    mov eax, 1
    mov dword [var_wintype], eax
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_390
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
if_end_244:
    jmp if_end_243
if_else_243:
    mov eax, dword [var_reel2]
    mov ebx, dword [var_reel3]
    cmp eax, ebx
    je if_then_249
    jmp if_else_249
if_then_249:
    mov eax, 1
    mov dword [var_wintype], eax
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_390
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_249
if_else_249:
    mov eax, dword [var_reel1]
    mov ebx, dword [var_reel3]
    cmp eax, ebx
    je if_then_250
    jmp if_else_250
if_then_250:
    mov eax, 1
    mov dword [var_wintype], eax
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_reward], eax
    push str_390
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_250
if_else_250:
    push str_391
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
if_end_250:
if_end_249:
if_end_243:
    mov eax, dword [var_reward]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_251
    jmp if_else_251
if_then_251:
    mov eax, dword [var_reward]
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_wintype]
    mov ebx, 2
    cmp eax, ebx
    je if_then_252
    jmp if_else_252
if_then_252:
    mov eax, dword [var_minigamewins]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigamewins], eax
    jmp if_end_252
if_else_252:
if_end_252:
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_392
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_reward]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_net], eax
    mov eax, dword [var_net]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_253
    jmp if_else_253
if_then_253:
    push dword [var_net]
    push str_393
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    jmp if_end_253
if_else_253:
    mov eax, dword [var_net]
    mov ebx, 0
    cmp eax, ebx
    je if_then_254
    jmp if_else_254
if_then_254:
    push str_394
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    jmp if_end_254
if_else_254:
    push dword [var_net]
    push str_395
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
if_end_254:
if_end_253:
    push str_3
    call _printf
    add esp, 4
    jmp if_end_251
if_else_251:
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_betamount]
    push str_396
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
if_end_251:
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_397
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_398
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_399
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_400
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_401
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_402
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
if_end_227:
    jmp if_end_221
if_else_221:
if_end_221:
    jmp if_end_128
if_else_128:
if_end_128:
    mov eax, dword [var_cmd]
    mov ebx, 7
    cmp eax, ebx
    je if_then_255
    jmp if_else_255
if_then_255:
    mov eax, dword [var_dailyclaimed]
    mov ebx, 0
    cmp eax, ebx
    je if_then_256
    jmp if_else_256
if_then_256:
    mov eax, dword [var_level]
    push eax
    mov eax, 10
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_rewardwood], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 10
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_rewardstone], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 5
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_rewardgold], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_rewardwood]
    pop ebx
    add ebx, dword [var_rewardwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_rewardstone]
    pop ebx
    add ebx, dword [var_rewardstone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_rewardgold]
    pop ebx
    add ebx, dword [var_rewardgold]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_rewardwood]
    push str_403
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_rewardstone]
    push str_404
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_rewardgold]
    push str_405
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, 1
    mov dword [var_dailyclaimed], eax
    mov eax, dword [var_dailyclaimed]
    mov ebx, 1
    cmp eax, ebx
    je if_then_257
    jmp if_else_257
if_then_257:
    push str_406
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    jmp if_end_257
if_else_257:
if_end_257:
    push 1500
    call _Sleep@4
    jmp if_end_256
if_else_256:
    push str_407
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 1000
    call _Sleep@4
if_end_256:
    jmp if_end_255
if_else_255:
if_end_255:
    mov eax, dword [var_cmd]
    mov ebx, 8
    cmp eax, ebx
    je if_then_258
    jmp if_else_258
if_then_258:
    mov eax, dword [var_bossalive]
    mov ebx, 0
    cmp eax, ebx
    je if_then_259
    jmp if_else_259
if_then_259:
    push str_408
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
    jmp if_end_259
if_else_259:
    mov eax, dword [var_level]
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_damage], eax
    mov eax, dword [var_bosshp]
    push eax
    mov eax, dword [var_damage]
    pop ebx
    sub ebx, dword [var_damage]
    mov eax, ebx
    mov dword [var_bosshp], eax
    push dword [var_damage]
    push str_409
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_bosshp]
    mov ebx, 1
    cmp eax, ebx
    jl if_then_260
    jmp if_else_260
if_then_260:
    mov eax, 0
    mov dword [var_bossalive], eax
    mov eax, dword [var_level]
    push eax
    mov eax, 50
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_leveltimes50], eax
    mov eax, dword [var_leveltimes50]
    push eax
    mov eax, dword [var_prestigebonus]
    pop ebx
    imul ebx, dword [var_prestigebonus]
    mov eax, ebx
    mov dword [var_reward], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_reward]
    pop ebx
    add ebx, dword [var_reward]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_reward]
    push eax
    mov eax, 2
    pop ebx
    mov eax, ebx
    mov ebx, eax
    mov eax, ebx
    mov ebx, 2
    cdq
    idiv ebx
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push str_410
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_260
if_else_260:
    push dword [var_bosshp]
    push str_411
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
if_end_260:
if_end_259:
    jmp if_end_258
if_else_258:
if_end_258:
    mov eax, dword [var_cmd]
    mov ebx, 9
    cmp eax, ebx
    je if_then_261
    jmp if_else_261
if_then_261:
    mov eax, 1
    mov dword [var_marketopen], eax
    cmp dword [var_rand_state_262], 0
    jne rand_init_262
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_262], eax
rand_init_262:
    mov eax, dword [var_rand_state_262]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_262]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_262], eax
    mov dword [var_rand_state_262], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_woodexchangerate], eax
    cmp dword [var_rand_state_263], 0
    jne rand_init_263
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_263], eax
rand_init_263:
    mov eax, dword [var_rand_state_263]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_263]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_263], eax
    mov dword [var_rand_state_263], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_stoneexchangerate], eax
    cmp dword [var_rand_state_264], 0
    jne rand_init_264
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_264], eax
rand_init_264:
    mov eax, dword [var_rand_state_264]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_264]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_264], eax
    mov dword [var_rand_state_264], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_goldexchangerate], eax
    mov eax, dword [var_prestigebonus]
    mov ebx, 1
    cmp eax, ebx
    jg if_then_265
    jmp if_else_265
if_then_265:
    mov eax, dword [var_woodexchangerate]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_woodexchangerate], eax
    mov eax, dword [var_stoneexchangerate]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stoneexchangerate], eax
    mov eax, dword [var_goldexchangerate]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_goldexchangerate], eax
    jmp if_end_265
if_else_265:
if_end_265:
    mov eax, dword [var_level]
    push eax
    mov eax, 10
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_baseamount], eax
    mov eax, dword [var_baseamount]
    mov ebx, 10
    cmp eax, ebx
    jl if_then_266
    jmp if_else_266
if_then_266:
    mov eax, 10
    mov dword [var_baseamount], eax
    jmp if_end_266
if_else_266:
if_end_266:
    mov eax, dword [var_traderachievement]
    mov ebx, 0
    cmp eax, ebx
    je if_then_267
    jmp if_else_267
if_then_267:
    mov eax, dword [var_tradesmade]
    mov ebx, 0
    cmp eax, ebx
    je if_then_268
    jmp if_else_268
if_then_268:
    mov eax, 0
    mov dword [var_tradesmade], eax
    jmp if_end_268
if_else_268:
if_end_268:
    jmp if_end_267
if_else_267:
if_end_267:
while_start_269:
    mov eax, dword [var_marketopen]
    mov ebx, 1
    cmp eax, ebx
    jne while_end_269
    call _clearscreen
    push str_412
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_413
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_88
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_gold]
    push dword [var_stone]
    push dword [var_wood]
    push str_89
    call _printf
    add esp, 16
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_woodexchangerate]
    push str_414
    call _printf
    add esp, 8
    push dword [var_baseamount]
    push dword [var_baseamount]
    push str_415
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_stoneexchangerate]
    push str_416
    call _printf
    add esp, 8
    push dword [var_baseamount]
    push dword [var_baseamount]
    push str_417
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_goldexchangerate]
    push str_418
    call _printf
    add esp, 8
    push dword [var_baseamount]
    push dword [var_baseamount]
    push str_419
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_420
    call _printf
    add esp, 4
    push str_421
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_422
    call _printf
    add esp, 4
    push str_423
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_424
    call _printf
    add esp, 4
    push str_425
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_426
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_91
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_427
    call _printf
    add esp, 4
    push var_choice
    push scanf_fmt_428
    call _scanf
    add esp, 8
    mov eax, dword [var_choice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_270
    jmp if_else_270
if_then_270:
    mov eax, dword [var_wood]
    mov ebx, dword [var_baseamount]
    cmp eax, ebx
    jg if_then_271
    jmp if_else_271
if_then_271:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_baseamount]
    pop ebx
    sub ebx, dword [var_baseamount]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_baseamount]
    push eax
    mov eax, dword [var_woodexchangerate]
    pop ebx
    imul ebx, dword [var_woodexchangerate]
    mov eax, ebx
    mov dword [var_stonegain], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_stonegain]
    pop ebx
    add ebx, dword [var_stonegain]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_tradesmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_tradesmade], eax
    push dword [var_stonegain]
    push dword [var_baseamount]
    push str_429
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
    jmp if_end_271
if_else_271:
    push dword [var_wood]
    push dword [var_baseamount]
    push str_430
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_271:
    jmp if_end_270
if_else_270:
if_end_270:
    mov eax, dword [var_choice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_272
    jmp if_else_272
if_then_272:
    mov eax, dword [var_stone]
    mov ebx, dword [var_baseamount]
    cmp eax, ebx
    jg if_then_273
    jmp if_else_273
if_then_273:
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_baseamount]
    pop ebx
    sub ebx, dword [var_baseamount]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_baseamount]
    push eax
    mov eax, dword [var_stoneexchangerate]
    pop ebx
    imul ebx, dword [var_stoneexchangerate]
    mov eax, ebx
    mov dword [var_goldgain], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_goldgain]
    pop ebx
    add ebx, dword [var_goldgain]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_tradesmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_tradesmade], eax
    push dword [var_goldgain]
    push dword [var_baseamount]
    push str_431
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
    jmp if_end_273
if_else_273:
    push dword [var_stone]
    push dword [var_baseamount]
    push str_432
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_273:
    jmp if_end_272
if_else_272:
if_end_272:
    mov eax, dword [var_choice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_274
    jmp if_else_274
if_then_274:
    mov eax, dword [var_gold]
    mov ebx, dword [var_baseamount]
    cmp eax, ebx
    jg if_then_275
    jmp if_else_275
if_then_275:
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_baseamount]
    pop ebx
    sub ebx, dword [var_baseamount]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_baseamount]
    push eax
    mov eax, dword [var_goldexchangerate]
    pop ebx
    imul ebx, dword [var_goldexchangerate]
    mov eax, ebx
    mov dword [var_woodgain], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_woodgain]
    pop ebx
    add ebx, dword [var_woodgain]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_tradesmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_tradesmade], eax
    push dword [var_woodgain]
    push dword [var_baseamount]
    push str_433
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
    jmp if_end_275
if_else_275:
    push dword [var_gold]
    push dword [var_baseamount]
    push str_434
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_275:
    jmp if_end_274
if_else_274:
if_end_274:
    mov eax, dword [var_choice]
    mov ebx, 4
    cmp eax, ebx
    je if_then_276
    jmp if_else_276
if_then_276:
    mov eax, dword [var_baseamount]
    push eax
    mov eax, 10
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_bulksamount], eax
    cmp dword [var_rand_state_277], 0
    jne rand_init_277
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_277], eax
rand_init_277:
    mov eax, dword [var_rand_state_277]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_277]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_277], eax
    mov dword [var_rand_state_277], eax
    mov ecx, 1
    mov ebx, 3
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_bulkbonus], eax
    call _clearscreen
    push str_435
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_436
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_bulkbonus]
    push dword [var_woodexchangerate]
    push str_437
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_bulkbonus]
    push dword [var_stoneexchangerate]
    push str_438
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push dword [var_bulkbonus]
    push dword [var_goldexchangerate]
    push str_439
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push str_440
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_441
    call _printf
    add esp, 4
    push var_bulkchoice
    push scanf_fmt_442
    call _scanf
    add esp, 8
    mov eax, dword [var_bulkchoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_278
    jmp if_else_278
if_then_278:
    mov eax, dword [var_wood]
    mov ebx, dword [var_bulksamount]
    cmp eax, ebx
    jg if_then_279
    jmp if_else_279
if_then_279:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_bulksamount]
    pop ebx
    sub ebx, dword [var_bulksamount]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_bulksamount]
    push eax
    mov eax, dword [var_woodexchangerate]
    push eax
    mov eax, dword [var_bulkbonus]
    pop ebx
    add ebx, dword [var_bulkbonus]
    mov eax, ebx
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_stonegain], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_stonegain]
    pop ebx
    add ebx, dword [var_stonegain]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_tradesmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_tradesmade], eax
    push dword [var_stonegain]
    push dword [var_bulksamount]
    push str_429
    call _printf
    add esp, 12
    push dword [var_woodexchangerate]
    push str_443
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 400
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_279
if_else_279:
    push dword [var_wood]
    push dword [var_bulksamount]
    push str_430
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_279:
    jmp if_end_278
if_else_278:
if_end_278:
    mov eax, dword [var_bulkchoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_280
    jmp if_else_280
if_then_280:
    mov eax, dword [var_stone]
    mov ebx, dword [var_bulksamount]
    cmp eax, ebx
    jg if_then_281
    jmp if_else_281
if_then_281:
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_bulksamount]
    pop ebx
    sub ebx, dword [var_bulksamount]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_bulksamount]
    push eax
    mov eax, dword [var_stoneexchangerate]
    push eax
    mov eax, dword [var_bulkbonus]
    pop ebx
    add ebx, dword [var_bulkbonus]
    mov eax, ebx
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_goldgain], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_goldgain]
    pop ebx
    add ebx, dword [var_goldgain]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_tradesmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_tradesmade], eax
    push dword [var_goldgain]
    push dword [var_bulksamount]
    push str_431
    call _printf
    add esp, 12
    push dword [var_stoneexchangerate]
    push str_443
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 400
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_281
if_else_281:
    push dword [var_stone]
    push dword [var_bulksamount]
    push str_432
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_281:
    jmp if_end_280
if_else_280:
if_end_280:
    mov eax, dword [var_bulkchoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_282
    jmp if_else_282
if_then_282:
    mov eax, dword [var_gold]
    mov ebx, dword [var_bulksamount]
    cmp eax, ebx
    jg if_then_283
    jmp if_else_283
if_then_283:
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_bulksamount]
    pop ebx
    sub ebx, dword [var_bulksamount]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_bulksamount]
    push eax
    mov eax, dword [var_goldexchangerate]
    push eax
    mov eax, dword [var_bulkbonus]
    pop ebx
    add ebx, dword [var_bulkbonus]
    mov eax, ebx
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_woodgain], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_woodgain]
    pop ebx
    add ebx, dword [var_woodgain]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_tradesmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_tradesmade], eax
    push dword [var_woodgain]
    push dword [var_bulksamount]
    push str_433
    call _printf
    add esp, 12
    push dword [var_goldexchangerate]
    push str_443
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push 400
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_283
if_else_283:
    push dword [var_gold]
    push dword [var_bulksamount]
    push str_434
    call _printf
    add esp, 12
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_283:
    jmp if_end_282
if_else_282:
if_end_282:
    jmp if_end_276
if_else_276:
if_end_276:
    mov eax, dword [var_choice]
    mov ebx, 5
    cmp eax, ebx
    je if_then_284
    jmp if_else_284
if_then_284:
    call _clearscreen
    push str_444
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_445
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_446
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_447
    call _printf
    add esp, 4
    push str_448
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_449
    call _printf
    add esp, 4
    push str_450
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_451
    call _printf
    add esp, 4
    push str_452
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_440
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push str_453
    call _printf
    add esp, 4
    push var_specchoice
    push scanf_fmt_454
    call _scanf
    add esp, 8
    mov eax, dword [var_specchoice]
    mov ebx, 4
    cmp eax, ebx
    jl if_then_285
    jmp if_else_285
if_then_285:
    push str_455
    call _printf
    add esp, 4
    push var_betamount
    push scanf_fmt_456
    call _scanf
    add esp, 8
    mov eax, dword [var_betamount]
    mov ebx, 10
    cmp eax, ebx
    jl if_then_286
    jmp if_else_286
if_then_286:
    mov eax, 10
    mov dword [var_betamount], eax
    jmp if_end_286
if_else_286:
if_end_286:
    mov eax, 0
    mov dword [var_canbet], eax
    mov eax, dword [var_specchoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_287
    jmp if_else_287
if_then_287:
    mov eax, dword [var_wood]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_288
    jmp if_else_288
if_then_288:
    mov eax, 1
    mov dword [var_canbet], eax
    jmp if_end_288
if_else_288:
if_end_288:
    jmp if_end_287
if_else_287:
if_end_287:
    mov eax, dword [var_specchoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_289
    jmp if_else_289
if_then_289:
    mov eax, dword [var_stone]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_290
    jmp if_else_290
if_then_290:
    mov eax, 1
    mov dword [var_canbet], eax
    jmp if_end_290
if_else_290:
if_end_290:
    jmp if_end_289
if_else_289:
if_end_289:
    mov eax, dword [var_specchoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_291
    jmp if_else_291
if_then_291:
    mov eax, dword [var_gold]
    mov ebx, dword [var_betamount]
    cmp eax, ebx
    jg if_then_292
    jmp if_else_292
if_then_292:
    mov eax, 1
    mov dword [var_canbet], eax
    jmp if_end_292
if_else_292:
if_end_292:
    jmp if_end_291
if_else_291:
if_end_291:
    mov eax, dword [var_canbet]
    mov ebx, 1
    cmp eax, ebx
    je if_then_293
    jmp if_else_293
if_then_293:
    cmp dword [var_rand_state_294], 0
    jne rand_init_294
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_294], eax
rand_init_294:
    mov eax, dword [var_rand_state_294]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_294]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_294], eax
    mov dword [var_rand_state_294], eax
    mov ecx, 1
    mov ebx, 100
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_specresult], eax
    mov eax, dword [var_specresult]
    mov ebx, 61
    cmp eax, ebx
    jl if_then_295
    jmp if_else_295
if_then_295:
    push 500
    call _boop
    add esp, 4
    push str_457
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_specchoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_296
    jmp if_else_296
if_then_296:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_winnings], eax
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_winnings]
    pop ebx
    add ebx, dword [var_winnings]
    mov eax, ebx
    mov dword [var_wood], eax
    push dword [var_winnings]
    push str_458
    call _printf
    add esp, 8
    jmp if_end_296
if_else_296:
if_end_296:
    mov eax, dword [var_specchoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_297
    jmp if_else_297
if_then_297:
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_winnings], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_winnings]
    pop ebx
    add ebx, dword [var_winnings]
    mov eax, ebx
    mov dword [var_stone], eax
    push dword [var_winnings]
    push str_459
    call _printf
    add esp, 8
    jmp if_end_297
if_else_297:
if_end_297:
    mov eax, dword [var_specchoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_298
    jmp if_else_298
if_then_298:
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, dword [var_betamount]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_winnings], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_winnings]
    pop ebx
    add ebx, dword [var_winnings]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_winnings]
    push str_460
    call _printf
    add esp, 8
    jmp if_end_298
if_else_298:
if_end_298:
    push str_3
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_295
if_else_295:
    push 100
    call _boop
    add esp, 4
    push str_461
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_specchoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_299
    jmp if_else_299
if_then_299:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_wood], eax
    push dword [var_betamount]
    push str_462
    call _printf
    add esp, 8
    jmp if_end_299
if_else_299:
if_end_299:
    mov eax, dword [var_specchoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_300
    jmp if_else_300
if_then_300:
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_stone], eax
    push dword [var_betamount]
    push str_463
    call _printf
    add esp, 8
    jmp if_end_300
if_else_300:
if_end_300:
    mov eax, dword [var_specchoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_301
    jmp if_else_301
if_then_301:
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_betamount]
    pop ebx
    sub ebx, dword [var_betamount]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_betamount]
    push str_464
    call _printf
    add esp, 8
    jmp if_end_301
if_else_301:
if_end_301:
    push str_3
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
if_end_295:
    mov eax, dword [var_speculationsmade]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_speculationsmade], eax
    jmp if_end_293
if_else_293:
    push str_311
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_293:
    jmp if_end_285
if_else_285:
if_end_285:
    jmp if_end_284
if_else_284:
if_end_284:
    mov eax, dword [var_choice]
    mov ebx, 6
    cmp eax, ebx
    je if_then_302
    jmp if_else_302
if_then_302:
    mov eax, dword [var_gold]
    mov ebx, 9
    cmp eax, ebx
    jg if_then_303
    jmp if_else_303
if_then_303:
    mov eax, dword [var_gold]
    push eax
    mov eax, 10
    pop ebx
    sub ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    cmp dword [var_rand_state_304], 0
    jne rand_init_304
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_304], eax
rand_init_304:
    mov eax, dword [var_rand_state_304]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_304]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_304], eax
    mov dword [var_rand_state_304], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_woodexchangerate], eax
    cmp dword [var_rand_state_305], 0
    jne rand_init_305
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_305], eax
rand_init_305:
    mov eax, dword [var_rand_state_305]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_305]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_305], eax
    mov dword [var_rand_state_305], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_stoneexchangerate], eax
    cmp dword [var_rand_state_306], 0
    jne rand_init_306
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_306], eax
rand_init_306:
    mov eax, dword [var_rand_state_306]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_306]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_306], eax
    mov dword [var_rand_state_306], eax
    mov ecx, 1
    mov ebx, 2
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_goldexchangerate], eax
    mov eax, dword [var_prestigebonus]
    mov ebx, 1
    cmp eax, ebx
    jg if_then_307
    jmp if_else_307
if_then_307:
    mov eax, dword [var_woodexchangerate]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_woodexchangerate], eax
    mov eax, dword [var_stoneexchangerate]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stoneexchangerate], eax
    mov eax, dword [var_goldexchangerate]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_goldexchangerate], eax
    jmp if_end_307
if_else_307:
if_end_307:
    push str_465
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
    jmp if_end_303
if_else_303:
    push str_466
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 100
    call _boop
    add esp, 4
    push 1000
    call _Sleep@4
if_end_303:
    jmp if_end_302
if_else_302:
if_end_302:
    mov eax, dword [var_choice]
    mov ebx, 7
    cmp eax, ebx
    je if_then_308
    jmp if_else_308
if_then_308:
    mov eax, 0
    mov dword [var_marketopen], eax
    push str_467
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 500
    call _Sleep@4
    jmp if_end_308
if_else_308:
if_end_308:
    jmp while_start_269
while_end_269:
    jmp if_end_261
if_else_261:
if_end_261:
    mov eax, dword [var_cmd]
    mov ebx, 10
    cmp eax, ebx
    je if_then_309
    jmp if_else_309
if_then_309:
    call _clearscreen
    push str_468
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push dword [var_level]
    push str_74
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_prestigelevel]
    push str_77
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_achievements]
    push str_469
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_stone]
    pop ebx
    add ebx, dword [var_stone]
    mov eax, ebx
    mov dword [var_total], eax
    mov eax, dword [var_total]
    push eax
    mov eax, dword [var_gold]
    pop ebx
    add ebx, dword [var_gold]
    mov eax, ebx
    mov dword [var_total], eax
    push dword [var_total]
    push str_470
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_turn]
    push str_471
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    push dword [var_totalcollections]
    push str_472
    call _printf
    add esp, 8
    push str_3
    call _printf
    add esp, 4
    mov eax, 1
    mov dword [var_gameover], eax
    jmp if_end_309
if_else_309:
if_end_309:
    mov eax, dword [var_hascollected]
    mov ebx, 1
    cmp eax, ebx
    je if_then_310
    jmp if_else_310
if_then_310:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_stone]
    pop ebx
    add ebx, dword [var_stone]
    mov eax, ebx
    mov dword [var_totalresources], eax
    mov eax, dword [var_totalresources]
    push eax
    mov eax, dword [var_gold]
    pop ebx
    add ebx, dword [var_gold]
    mov eax, ebx
    mov dword [var_totalresources], eax
    mov eax, dword [var_rich]
    mov ebx, 0
    cmp eax, ebx
    je if_then_311
    jmp if_else_311
if_then_311:
    mov eax, dword [var_totalresources]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_312
    jmp if_else_312
if_then_312:
    mov eax, 1
    mov dword [var_rich], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_473
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_312
if_else_312:
if_end_312:
    jmp if_end_311
if_else_311:
if_end_311:
    mov eax, dword [var_wealthy]
    mov ebx, 0
    cmp eax, ebx
    je if_then_313
    jmp if_else_313
if_then_313:
    mov eax, dword [var_totalresources]
    mov ebx, 999
    cmp eax, ebx
    jg if_then_314
    jmp if_else_314
if_then_314:
    mov eax, 1
    mov dword [var_wealthy], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_474
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_314
if_else_314:
if_end_314:
    jmp if_end_313
if_else_313:
if_end_313:
    mov eax, dword [var_millionaire]
    mov ebx, 0
    cmp eax, ebx
    je if_then_315
    jmp if_else_315
if_then_315:
    mov eax, dword [var_totalresources]
    mov ebx, 9999
    cmp eax, ebx
    jg if_then_316
    jmp if_else_316
if_then_316:
    mov eax, 1
    mov dword [var_millionaire], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_475
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_316
if_else_316:
if_end_316:
    jmp if_end_315
if_else_315:
if_end_315:
    mov eax, dword [var_woodmaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_317
    jmp if_else_317
if_then_317:
    mov eax, dword [var_wood]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_318
    jmp if_else_318
if_then_318:
    mov eax, 1
    mov dword [var_woodmaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_476
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_318
if_else_318:
if_end_318:
    jmp if_end_317
if_else_317:
if_end_317:
    mov eax, dword [var_stonemaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_319
    jmp if_else_319
if_then_319:
    mov eax, dword [var_stone]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_320
    jmp if_else_320
if_then_320:
    mov eax, 1
    mov dword [var_stonemaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_477
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_320
if_else_320:
if_end_320:
    jmp if_end_319
if_else_319:
if_end_319:
    mov eax, dword [var_goldmaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_321
    jmp if_else_321
if_then_321:
    mov eax, dword [var_gold]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_322
    jmp if_else_322
if_then_322:
    mov eax, 1
    mov dword [var_goldmaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_478
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_322
if_else_322:
if_end_322:
    jmp if_end_321
if_else_321:
if_end_321:
    mov eax, dword [var_woodtycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_323
    jmp if_else_323
if_then_323:
    mov eax, dword [var_wood]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_324
    jmp if_else_324
if_then_324:
    mov eax, 1
    mov dword [var_woodtycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_479
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_324
if_else_324:
if_end_324:
    jmp if_end_323
if_else_323:
if_end_323:
    mov eax, dword [var_stonetycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_325
    jmp if_else_325
if_then_325:
    mov eax, dword [var_stone]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_326
    jmp if_else_326
if_then_326:
    mov eax, 1
    mov dword [var_stonetycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_480
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_326
if_else_326:
if_end_326:
    jmp if_end_325
if_else_325:
if_end_325:
    mov eax, dword [var_goldtycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_327
    jmp if_else_327
if_then_327:
    mov eax, dword [var_gold]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_328
    jmp if_else_328
if_then_328:
    mov eax, 1
    mov dword [var_goldtycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_481
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_328
if_else_328:
if_end_328:
    jmp if_end_327
if_else_327:
if_end_327:
    mov eax, dword [var_minigamemaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_329
    jmp if_else_329
if_then_329:
    mov eax, dword [var_minigamewins]
    mov ebx, 9
    cmp eax, ebx
    jg if_then_330
    jmp if_else_330
if_then_330:
    mov eax, 1
    mov dword [var_minigamemaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_482
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_330
if_else_330:
if_end_330:
    jmp if_end_329
if_else_329:
if_end_329:
    mov eax, dword [var_eventexplorer]
    mov ebx, 0
    cmp eax, ebx
    je if_then_331
    jmp if_else_331
if_then_331:
    mov eax, dword [var_totalevents]
    mov ebx, 19
    cmp eax, ebx
    jg if_then_332
    jmp if_else_332
if_then_332:
    mov eax, 1
    mov dword [var_eventexplorer], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_483
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_332
if_else_332:
if_end_332:
    jmp if_end_331
if_else_331:
if_end_331:
    mov eax, dword [var_turnveteran]
    mov ebx, 0
    cmp eax, ebx
    je if_then_333
    jmp if_else_333
if_then_333:
    mov eax, dword [var_turn]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_334
    jmp if_else_334
if_then_334:
    mov eax, 1
    mov dword [var_turnveteran], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_484
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_334
if_else_334:
if_end_334:
    jmp if_end_333
if_else_333:
if_end_333:
    mov eax, dword [var_collectoraddict]
    mov ebx, 0
    cmp eax, ebx
    je if_then_335
    jmp if_else_335
if_then_335:
    mov eax, dword [var_totalcollections]
    mov ebx, 199
    cmp eax, ebx
    jg if_then_336
    jmp if_else_336
if_then_336:
    mov eax, 1
    mov dword [var_collectoraddict], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_485
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_336
if_else_336:
if_end_336:
    jmp if_end_335
if_else_335:
if_end_335:
    mov eax, dword [var_ironfist]
    mov ebx, 0
    cmp eax, ebx
    je if_then_337
    jmp if_else_337
if_then_337:
    mov eax, dword [var_level]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_338
    jmp if_else_338
if_then_338:
    mov eax, 1
    mov dword [var_ironfist], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_486
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_338
if_else_338:
if_end_338:
    jmp if_end_337
if_else_337:
if_end_337:
    mov eax, dword [var_collectorpro]
    mov ebx, 0
    cmp eax, ebx
    je if_then_339
    jmp if_else_339
if_then_339:
    mov eax, dword [var_totalcollections]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_340
    jmp if_else_340
if_then_340:
    mov eax, 1
    mov dword [var_collectorpro], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_487
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_340
if_else_340:
if_end_340:
    jmp if_end_339
if_else_339:
if_end_339:
    mov eax, dword [var_ultrarich]
    mov ebx, 0
    cmp eax, ebx
    je if_then_341
    jmp if_else_341
if_then_341:
    mov eax, dword [var_totalresources]
    mov ebx, 99999
    cmp eax, ebx
    jg if_then_342
    jmp if_else_342
if_then_342:
    mov eax, 1
    mov dword [var_ultrarich], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_488
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_342
if_else_342:
if_end_342:
    jmp if_end_341
if_else_341:
if_end_341:
    mov eax, dword [var_grinder]
    mov ebx, 0
    cmp eax, ebx
    je if_then_343
    jmp if_else_343
if_then_343:
    mov eax, dword [var_turn]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_344
    jmp if_else_344
if_then_344:
    mov eax, 1
    mov dword [var_grinder], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_489
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_344
if_else_344:
if_end_344:
    jmp if_end_343
if_else_343:
if_end_343:
    mov eax, dword [var_hoarder]
    mov ebx, 0
    cmp eax, ebx
    je if_then_345
    jmp if_else_345
if_then_345:
    mov eax, dword [var_wood]
    mov ebx, 4999
    cmp eax, ebx
    jg if_then_346
    jmp if_else_346
if_then_346:
    mov eax, 1
    mov dword [var_hoarder], eax
    jmp if_end_346
if_else_346:
if_end_346:
    mov eax, dword [var_stone]
    mov ebx, 4999
    cmp eax, ebx
    jg if_then_347
    jmp if_else_347
if_then_347:
    mov eax, 1
    mov dword [var_hoarder], eax
    jmp if_end_347
if_else_347:
if_end_347:
    mov eax, dword [var_gold]
    mov ebx, 4999
    cmp eax, ebx
    jg if_then_348
    jmp if_else_348
if_then_348:
    mov eax, 1
    mov dword [var_hoarder], eax
    jmp if_end_348
if_else_348:
if_end_348:
    mov eax, dword [var_hoarder]
    mov ebx, 1
    cmp eax, ebx
    je if_then_349
    jmp if_else_349
if_then_349:
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_490
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_349
if_else_349:
if_end_349:
    jmp if_end_345
if_else_345:
if_end_345:
    mov eax, dword [var_unstoppable]
    mov ebx, 0
    cmp eax, ebx
    je if_then_350
    jmp if_else_350
if_then_350:
    mov eax, dword [var_minigamewins]
    mov ebx, 24
    cmp eax, ebx
    jg if_then_351
    jmp if_else_351
if_then_351:
    mov eax, 1
    mov dword [var_unstoppable], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_491
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_351
if_else_351:
if_end_351:
    jmp if_end_350
if_else_350:
if_end_350:
    mov eax, dword [var_eventlegend]
    mov ebx, 0
    cmp eax, ebx
    je if_then_352
    jmp if_else_352
if_then_352:
    mov eax, dword [var_totalevents]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_353
    jmp if_else_353
if_then_353:
    mov eax, 1
    mov dword [var_eventlegend], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_492
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_353
if_else_353:
if_end_353:
    jmp if_end_352
if_else_352:
if_end_352:
    mov eax, dword [var_jackpot]
    mov ebx, 0
    cmp eax, ebx
    je if_then_354
    jmp if_else_354
if_then_354:
    mov eax, dword [var_minigamewins]
    mov ebx, 14
    cmp eax, ebx
    jg if_then_355
    jmp if_else_355
if_then_355:
    mov eax, 1
    mov dword [var_jackpot], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_493
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_355
if_else_355:
if_end_355:
    jmp if_end_354
if_else_354:
if_end_354:
    mov eax, dword [var_dedicated]
    mov ebx, 0
    cmp eax, ebx
    je if_then_356
    jmp if_else_356
if_then_356:
    mov eax, dword [var_turn]
    mov ebx, 999
    cmp eax, ebx
    jg if_then_357
    jmp if_else_357
if_then_357:
    mov eax, 1
    mov dword [var_dedicated], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_494
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_357
if_else_357:
if_end_357:
    jmp if_end_356
if_else_356:
if_end_356:
    mov eax, dword [var_maxedout]
    mov ebx, 0
    cmp eax, ebx
    je if_then_358
    jmp if_else_358
if_then_358:
    mov eax, dword [var_level]
    mov ebx, 199
    cmp eax, ebx
    jg if_then_359
    jmp if_else_359
if_then_359:
    mov eax, 1
    mov dword [var_maxedout], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_495
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_359
if_else_359:
if_end_359:
    jmp if_end_358
if_else_358:
if_end_358:
    mov eax, dword [var_maxedout]
    mov ebx, 0
    cmp eax, ebx
    je if_then_360
    jmp if_else_360
if_then_360:
    mov eax, dword [var_level]
    mov ebx, 199
    cmp eax, ebx
    jg if_then_361
    jmp if_else_361
if_then_361:
    mov eax, 1
    mov dword [var_maxedout], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_495
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_361
if_else_361:
if_end_361:
    jmp if_end_360
if_else_360:
if_end_360:
    mov eax, dword [var_traderachievement]
    mov ebx, 0
    cmp eax, ebx
    je if_then_362
    jmp if_else_362
if_then_362:
    mov eax, dword [var_tradesmade]
    mov ebx, 9
    cmp eax, ebx
    jg if_then_363
    jmp if_else_363
if_then_363:
    mov eax, 1
    mov dword [var_traderachievement], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_496
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_363
if_else_363:
if_end_363:
    jmp if_end_362
if_else_362:
if_end_362:
    mov eax, dword [var_speculatorachievement]
    mov ebx, 0
    cmp eax, ebx
    je if_then_364
    jmp if_else_364
if_then_364:
    mov eax, dword [var_speculationsmade]
    mov ebx, 4
    cmp eax, ebx
    jg if_then_365
    jmp if_else_365
if_then_365:
    mov eax, 1
    mov dword [var_speculatorachievement], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_497
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_365
if_else_365:
if_end_365:
    jmp if_end_364
if_else_364:
if_end_364:
    mov eax, dword [var_markettycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_366
    jmp if_else_366
if_then_366:
    mov eax, dword [var_tradesmade]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_367
    jmp if_else_367
if_then_367:
    mov eax, 1
    mov dword [var_markettycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_498
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_367
if_else_367:
if_end_367:
    jmp if_end_366
if_else_366:
if_end_366:
    mov eax, dword [var_buildingachievement]
    mov ebx, 0
    cmp eax, ebx
    je if_then_368
    jmp if_else_368
if_then_368:
    mov eax, dword [var_totalbuildings]
    mov ebx, 4
    cmp eax, ebx
    jg if_then_369
    jmp if_else_369
if_then_369:
    mov eax, 1
    mov dword [var_buildingachievement], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_499
    call _printf
    add esp, 4
    push str_3
    call _printf
    add esp, 4
    push 300
    call _boop
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_369
if_else_369:
if_end_369:
    jmp if_end_368
if_else_368:
if_end_368:
    jmp if_end_310
if_else_310:
if_end_310:
    mov eax, dword [var_gameover]
    mov ebx, 1
    cmp eax, ebx
    je if_then_370
    jmp if_else_370
if_then_370:
    mov eax, 3
    mov esp, ebp
    pop ebp
    ret
    mov eax, 1
    ret
    jmp if_end_370
if_else_370:
if_end_370:
    mov eax, dword [var_turn]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_turn], eax
    mov eax, dword [var_turn]
    mov ebx, 50
    cmp eax, ebx
    jg if_then_371
    jmp if_else_371
if_then_371:
    mov eax, 0
    mov dword [var_dailyclaimed], eax
    mov eax, 0
    mov dword [var_turn], eax
    jmp if_end_371
if_else_371:
if_end_371:
    push 1000
    call _Sleep@4
    jmp loop_start_2
loop_end_2:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
    ret
