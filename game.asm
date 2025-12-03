_clearscreen:
    push ebp
    mov ebp, esp
    push cmd_254
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
    mov eax, dword [var_autocollect]
    push eax
    mov eax, dword [var_multiplier]
    pop ebx
    imul ebx, dword [var_multiplier]
    mov eax, ebx
    mov dword [var_basecollect], eax
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
    mov dword [var_wood], eax
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_totalcollect]
    pop ebx
    add ebx, dword [var_totalcollect]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_totalcollect]
    pop ebx
    add ebx, dword [var_totalcollect]
    mov eax, ebx
    mov dword [var_gold], eax
    mov eax, 1
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
    push str_255
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_wood]
    push str_68
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_stone]
    push str_69
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_gold]
    push str_70
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_level]
    push str_71
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_autocollect]
    push str_256
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_multiplier]
    push str_78
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigebonus]
    push dword [var_prestigelevel]
    push str_257
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
    push dword [var_achievements]
    push str_79
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_1
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
    push str_258
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret

extern _Sleep@4
extern _printf
extern _scanf
extern _system
extern _time

section .data
str_0 db "=== RESOURCE COLLECTOR GAME ===", 0
str_1 db 10, 0
str_2 db "Commands: 1=collect, 2=upgrade, 3=status, 4=shop, 5=achievements, 6=minigames, 7=daily reward, 8=boss fight, 9=exit ", 0
str_3 db "Lucky event! Auto collect doubled this turn.", 0
str_4 db "Forest discovery! Found %d wood.", 0
str_5 db "Quarry discovery! Found %d stone.", 0
str_6 db "Gold vein discovered! Found %d gold.", 0
str_7 db "Market boom! All resources doubled this turn.", 0
str_8 db "Enter command: ", 0
scanf_fmt_9 db "%d", 0
str_10 db "=== 1337 H4X0R M0D3 4CT1V4T3D! ===", 0
str_11 db "L33T skills detected! +337 of each resource!", 0
str_12 db "=== THE ANSWER TO LIFE, THE UNIVERSE, AND EVERYTHING! ===", 0
str_13 db "You found the meaning of life! Resources multiplied!", 0
str_14 db "=== JACKPOT! ===", 0
str_15 db "Lucky number 777! Instant level up and +77 resources!", 0
str_16 db "=== EMERGENCY RESOURCES DEPLOYED! ===", 0
str_17 db "Help is on the way! +911 resources incoming!", 0
str_18 db "=== SEQUENCE RECOGNIZED! ===", 0
str_19 db "Simple but effective! +1234 wood!", 0
str_20 db "=== BRITISH EMERGENCY! ===", 0
str_21 db "Help requested! +999 stone for sturdy structures!", 0
str_22 db "=== PI POWER! ===", 0
str_23 db "Infinite resources? Almost! +314 of everything!", 0
str_24 db "=== RESOURCE NOT FOUND ===", 0
str_25 db "Just kidding! Found hidden cache! +404 gold!", 0
str_26 db "=== IMMATURE BUT REWARDING! ===", 0
str_27 db "Heh. You know what this means. +800 resources!", 0
str_28 db "=== THAT'S THE SAME COMBINATION AS MY LUGGAGE! ===", 0
str_29 db "Spaceballs reference! +12345 total resources split evenly!", 0
str_30 db "=== PRISONER 24601! ===", 0
str_31 db "Jean Valjean would be proud! Prestige cost reduced!", 0
str_32 db "=== JENNY, I GOT YOUR NUMBER! ===", 0
str_33 db "For a good time, collect +867 resources!", 0
str_34 db "=== DECLARATION OF INDEPENDENCE! ===", 0
str_35 db "Freedom from resource scarcity! +1776 of everything!", 0
str_36 db "=== BIG BROTHER IS WATCHING ===", 0
str_37 db "Doublethink activated! Resources are both there and not there!", 0
str_38 db "=== OPEN THE POD BAY DOORS, HAL ===", 0
str_39 db "I'm sorry Dave, I'm afraid I can do that... just kidding! +2001 resources!", 0
str_40 db "=== THE TEMPLES OF SYRINX ===", 0
str_41 db "We've taken care of everything! +2112 resources!", 0
str_42 db "=== NEW WORLD DISCOVERED! ===", 0
str_43 db "You discovered new resources! +1492 of each!", 0
str_44 db "=== NORMAN CONQUEST! ===", 0
str_45 db "William the Conqueror approves! +1066 resources!", 0
str_46 db "=== NICE! ===", 0
str_47 db "Nice. +69 of everything!", 0
str_48 db "=== So wrong, resetting all ===", 0
str_49 db "=== BLAZE IT ===", 0
str_50 db "Smoke 'em if you got 'em! +420 resources!", 0
str_51 db "Nice. +67 of everything!", 0
str_52 db "Collecting resources...", 0
str_53 db "You collected %d wood.", 0
str_54 db "You collected %d stone.", 0
str_55 db "You collected %d gold.", 0
str_56 db "=== ACHIEVEMENT UNLOCKED: First Steps! ===", 0
str_57 db "Upgrading...", 0
str_58 db "Upgrade successful!", 0
str_59 db "=== ACHIEVEMENT UNLOCKED: Halfway There! (Level 5) ===", 0
str_60 db "=== ACHIEVEMENT UNLOCKED: Master Collector! (Level 10) ===", 0
str_61 db "=== ACHIEVEMENT UNLOCKED: Grand Master! (Level 20) ===", 0
str_62 db "=== ACHIEVEMENT UNLOCKED: Legendary Collector! (Level 50) ===", 0
str_63 db "=== ACHIEVEMENT UNLOCKED: Shopaholic! (Level 3+) ===", 0
str_64 db "=== ACHIEVEMENT UNLOCKED: Speedrunner! (Level 5 in <20 turns) ===", 0
str_65 db "Not enough resources for upgrade!", 0
str_66 db "Need Wood: %d, Stone: %d, Gold: %d", 0
str_67 db "=== STATUS ===", 0
str_68 db "Wood: %d", 0
str_69 db "Stone: %d", 0
str_70 db "Gold: %d", 0
str_71 db "Level: %d", 0
str_72 db "Auto Collect: %d", 0
str_73 db "Upgrade Cost: %d", 0
str_74 db "Prestige Level: %d", 0
str_75 db "Prestige Bonus: x%d", 0
str_76 db "Next Prestige Cost: %d total resources", 0
str_77 db "Next Upgrade Needs: Wood %d, Stone %d, Gold %d", 0
str_78 db "Multiplier: %d", 0
str_79 db "Achievements: %d/30", 0
str_80 db "=== SHOP ===", 0
str_81 db "1: Multiplier Boost (+1) - Cost: %d Gold", 0
str_82 db "2: Wood Cutter - Cost: %d Stone, %d Gold", 0
str_83 db "3: Stone Mason - Cost: %d Wood, %d Gold", 0
str_84 db "4: Prestige (Reset for permanent x2 bonus)", 0
str_85 db "   Cost: %d total resources", 0
str_86 db "   Current: %d/%d", 0
str_87 db "Enter choice: ", 0
scanf_fmt_88 db "%d", 0
str_89 db "Multiplier boosted!", 0
str_90 db "Not enough gold for boost!", 0
str_91 db "Wood Cutter hired! Gained %d wood.", 0
str_92 db "Need Stone: %d, Gold: %d", 0
str_93 db "Stone Mason hired! Gained %d stone.", 0
str_94 db "Need Wood: %d, Gold: %d", 0
str_95 db "PRESTIGE ACHIEVED!", 0
str_96 db "All resources converted to permanent bonus!", 0
str_97 db "Game reset with x%d production bonus!", 0
str_98 db "Not enough resources for prestige!", 0
str_99 db "Need %d total resources, you have %d", 0
str_100 db "=== ACHIEVEMENTS (%d/30) ===", 0
str_101 db "[X] First Steps - Collect your first resource", 0
str_102 db "[ ] First Steps - Collect your first resource", 0
str_103 db "[X] Halfway There - Reach Level 5", 0
str_104 db "[ ] Halfway There - Reach Level 5", 0
str_105 db "[X] Master Collector - Reach Level 10", 0
str_106 db "[ ] Master Collector - Reach Level 10", 0
str_107 db "[X] Grand Master - Reach Level 20", 0
str_108 db "[ ] Grand Master - Reach Level 20", 0
str_109 db "[X] Legendary Collector - Reach Level 50", 0
str_110 db "[ ] Legendary Collector - Reach Level 50", 0
str_111 db "[X] Resource Baron - Collect 100+ total resources", 0
str_112 db "[ ] Resource Baron - Collect 100+ total resources", 0
str_113 db "[X] Wealthy Magnate - Collect 1,000+ total resources", 0
str_114 db "[ ] Wealthy Magnate - Collect 1,000+ total resources", 0
str_115 db "[X] Resource Millionaire - Collect 10,000+ total resources", 0
str_116 db "[ ] Resource Millionaire - Collect 10,000+ total resources", 0
str_117 db "[X] Lumberjack - Collect 50+ wood", 0
str_118 db "[ ] Lumberjack - Collect 50+ wood", 0
str_119 db "[X] Quarry King - Collect 50+ stone", 0
str_120 db "[ ] Quarry King - Collect 50+ stone", 0
str_121 db "[X] Gold Digger - Collect 50+ gold", 0
str_122 db "[ ] Gold Digger - Collect 50+ gold", 0
str_123 db "[X] Wood Tycoon - Collect 500+ wood", 0
str_124 db "[ ] Wood Tycoon - Collect 500+ wood", 0
str_125 db "[X] Stone Tycoon - Collect 500+ stone", 0
str_126 db "[ ] Stone Tycoon - Collect 500+ stone", 0
str_127 db "[X] Gold Tycoon - Collect 500+ gold", 0
str_128 db "[ ] Gold Tycoon - Collect 500+ gold", 0
str_129 db "[X] Speedrunner - Reach Level 5 in under 20 turns", 0
str_130 db "[ ] Speedrunner - Reach Level 5 in under 20 turns", 0
str_131 db "[X] Shopaholic - Reach Level 3", 0
str_132 db "[ ] Shopaholic - Reach Level 3", 0
str_133 db "[X] Minigame Master - Win 10 minigames", 0
str_134 db "[ ] Minigame Master - Win 10 minigames", 0
str_135 db "[X] Event Explorer - Experience 20 random events", 0
str_136 db "[ ] Event Explorer - Experience 20 random events", 0
str_137 db "[X] Turn Veteran - Play 100 turns", 0
str_138 db "[ ] Turn Veteran - Play 100 turns", 0
str_139 db "[X] Collector Addict - Make 200 collections", 0
str_140 db "[ ] Collector Addict - Make 200 collections", 0
str_141 db "[X] Iron Fist - Reach Level 100", 0
str_142 db "[ ] Iron Fist - Reach Level 100", 0
str_143 db "[X] Collector Pro - Make 500 collections", 0
str_144 db "[ ] Collector Pro - Make 500 collections", 0
str_145 db "[X] Ultra Rich - Collect 100,000+ total resources", 0
str_146 db "[ ] Ultra Rich - Collect 100,000+ total resources", 0
str_147 db "[X] Grinder - Play 500 turns", 0
str_148 db "[ ] Grinder - Play 500 turns", 0
str_149 db "[X] Hoarder - Reach 5,000 of any resource", 0
str_150 db "[ ] Hoarder - Reach 5,000 of any resource", 0
str_151 db "[X] Unstoppable - Win 25 minigames", 0
str_152 db "[ ] Unstoppable - Win 25 minigames", 0
str_153 db "[X] Event Legend - Experience 100 random events", 0
str_154 db "[ ] Event Legend - Experience 100 random events", 0
str_155 db "[X] Jackpot - Win 15 minigames", 0
str_156 db "[ ] Jackpot - Win 15 minigames", 0
str_157 db "[X] Dedicated - Play 1,000 turns", 0
str_158 db "[ ] Dedicated - Play 1,000 turns", 0
str_159 db "[X] Maxed Out - Reach Level 200", 0
str_160 db "[ ] Maxed Out - Reach Level 200", 0
str_161 db "=== MINIGAME ARCADE ===", 0
str_162 db "Choose a minigame:", 0
str_163 db "1: Guess the Number (1-5)", 0
str_164 db "2: Card Guessing (Higher/Lower)", 0
str_165 db "3: Math Quiz", 0
str_166 db "Enter choice (1-3): ", 0
scanf_fmt_167 db "%d", 0
str_168 db "=== GUESS THE NUMBER MINIGAME ===", 0
str_169 db "Guess a number between 1 and 5!", 0
str_170 db "Win big rewards if you guess correctly!", 0
str_171 db "Enter your guess (1-5): ", 0
scanf_fmt_172 db "%d", 0
str_173 db "Congratulations! You guessed it!", 0
str_174 db "You won %d of each resource!", 0
str_175 db "Wrong! The number was %d", 0
str_176 db "Better luck next time!", 0
str_177 db "=== CARD GUESSING GAME ===", 0
str_178 db "Guess if the next card is HIGHER or LOWER!", 0
str_179 db "Win streak increases rewards!", 0
str_180 db "Cards are numbered 1-13", 0
str_181 db "First card: %d", 0
str_182 db "Round %d of 5", 0
str_183 db "Current streak: %d", 0
str_184 db "========================", 0
str_185 db "Current card: %d", 0
str_186 db "Guess next card:", 0
str_187 db "1 = HIGHER", 0
str_188 db " 2 = LOWER", 0
scanf_fmt_189 db "%d", 0
str_190 db "Next card: %d", 0
str_191 db "Same card! No change to streak.", 0
str_192 db "Correct! Streak: %d", 0
str_193 db "Wrong! Streak broken.", 0
str_194 db "Continue to next round?", 0
str_195 db "1 = YES", 0
str_196 db " 2 = NO (Cash out now)", 0
scanf_fmt_197 db "%d", 0
str_198 db "=== CARD GAME RESULTS ===", 0
str_199 db "Maximum Streak: %d", 0
str_200 db "Reward Multiplier: x%d", 0
str_201 db "No winning streaks this game.", 0
str_202 db "Try again for better luck!", 0
str_203 db "=== MATH QUIZ CHALLENGE ===", 0
str_204 db "Solve math problems for bonuses!", 0
str_205 db "Difficulty increases with your level!", 0
str_206 db "--- Question %d of %d ---", 0
str_207 db "What is %d + %d?", 0
str_208 db "What is %d - %d?", 0
str_209 db "What is %d * %d?", 0
str_210 db "What is %d / %d?", 0
str_211 db "Enter your answer: ", 0
scanf_fmt_212 db "%d", 0
str_213 db "Correct! +1 point", 0
str_214 db "Wrong! The answer was %d", 0
str_215 db "Quiz Complete! Score: %d/%d", 0
str_216 db "Quiz Complete! Score: 0/%d", 0
str_217 db "Study up and try again!", 0
str_218 db "+%d wood", 0
str_219 db "+%d stone", 0
str_220 db "+%d gold", 0
str_221 db "Daily reward collected!", 0
str_222 db "Daily reward already collected.", 0
str_223 db "No boss right now.", 0
str_224 db "You deal %d damage!", 0
str_225 db "Boss defeated! Massive resource drop!", 0
str_226 db "Boss HP: %d", 0
str_227 db "Exiting game...", 0
str_228 db "Total Resources: %d", 0
str_229 db "Turns Played: %d", 0
str_230 db "Collections Made: %d", 0
str_231 db "=== ACHIEVEMENT UNLOCKED: Resource Baron! (100+ total resources) ===", 0
str_232 db "=== ACHIEVEMENT UNLOCKED: Wealthy Magnate! (1,000+ total resources) ===", 0
str_233 db "=== ACHIEVEMENT UNLOCKED: Resource Millionaire! (10,000+ total resources) ===", 0
str_234 db "=== ACHIEVEMENT UNLOCKED: Lumberjack! (50+ wood) ===", 0
str_235 db "=== ACHIEVEMENT UNLOCKED: Quarry King! (50+ stone) ===", 0
str_236 db "=== ACHIEVEMENT UNLOCKED: Gold Digger! (50+ gold) ===", 0
str_237 db "=== ACHIEVEMENT UNLOCKED: Wood Tycoon! (500+ wood) ===", 0
str_238 db "=== ACHIEVEMENT UNLOCKED: Stone Tycoon! (500+ stone) ===", 0
str_239 db "=== ACHIEVEMENT UNLOCKED: Gold Tycoon! (500+ gold) ===", 0
str_240 db "=== ACHIEVEMENT UNLOCKED: Minigame Master! (10 minigame wins) ===", 0
str_241 db "=== ACHIEVEMENT UNLOCKED: Event Explorer! (20 random events) ===", 0
str_242 db "=== ACHIEVEMENT UNLOCKED: Turn Veteran! (100 turns played) ===", 0
str_243 db "=== ACHIEVEMENT UNLOCKED: Collector Addict! (200 collections made) ===", 0
str_244 db "=== ACHIEVEMENT UNLOCKED: Iron Fist! (Level 100) ===", 0
str_245 db "=== ACHIEVEMENT UNLOCKED: Collector Pro! (500 collections) ===", 0
str_246 db "=== ACHIEVEMENT UNLOCKED: Ultra Rich! (100,000+ total resources) ===", 0
str_247 db "=== ACHIEVEMENT UNLOCKED: Grinder! (500 turns played) ===", 0
str_248 db "=== ACHIEVEMENT UNLOCKED: Hoarder! (5,000+ of a resource) ===", 0
str_249 db "=== ACHIEVEMENT UNLOCKED: Unstoppable! (25 minigame wins) ===", 0
str_250 db "=== ACHIEVEMENT UNLOCKED: Event Legend! (100 random events) ===", 0
str_251 db "=== ACHIEVEMENT UNLOCKED: Jackpot! (15 minigame wins) ===", 0
str_252 db "=== ACHIEVEMENT UNLOCKED: Dedicated! (1,000 turns played) ===", 0
str_253 db "=== ACHIEVEMENT UNLOCKED: Maxed Out! (Level 200) ===", 0
cmd_254 db "cls", 0
str_255 db "Turn: %d", 0
str_256 db "Auto Collect Rate: %d", 0
str_257 db "Prestige: Level %d (x%d bonus)", 0
str_258 db "A wild RESOURCE GOLEM appears!", 0

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
var_eventtype resd 1
var_rand_state_2 resd 1
var_bonuswood resd 1
var_rand_state_5 resd 1
var_bonusstone resd 1
var_rand_state_7 resd 1
var_bonusgold resd 1
var_rand_state_9 resd 1
var_totalcollect resd 1
var_basecollect resd 1
var_cmd resd 1
var_resourcetype resd 1
var_rand_state_36 resd 1
var_collectamount resd 1
var_requiredwood resd 1
var_requiredstone resd 1
var_requiredgold resd 1
var_canupgrade resd 1
var_nextwood resd 1
var_nextstone resd 1
var_nextgold resd 1
var_boostcost resd 1
var_shopstone resd 1
var_shopgold resd 1
var_shopwood resd 1
var_currenttotal resd 1
var_choice resd 1
var_canbuy resd 1
var_woodbonus resd 1
var_stonebonus resd 1
var_totalresources resd 1
var_gamechoice resd 1
var_secretnumber resd 1
var_rand_state_116 resd 1
var_guess resd 1
var_reward resd 1
var_currentcard resd 1
var_rand_state_119 resd 1
var_streak resd 1
var_maxstreak resd 1
var_round resd 1
var_playerguess resd 1
var_nextcard resd 1
var_rand_state_121 resd 1
var_correct resd 1
var_continue resd 1
var_correctanswers resd 1
var_totalquestions resd 1
var_maxnumber resd 1
var_question resd 1
var_num1 resd 1
var_rand_state_137 resd 1
var_num2 resd 1
var_rand_state_138 resd 1
var_operation resd 1
var_rand_state_139 resd 1
var_temp123124 resd 1
var_rand_state_141 resd 1
var_correctanswer resd 1
var_playeranswer resd 1
var_rewardwood resd 1
var_rewardstone resd 1
var_rewardgold resd 1
var_damage resd 1
var_leveltimes50 resd 1
var_total resd 1

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
    call _clearscreen
loop_start_0:
    call _clearscreen
    push str_0
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_2
    call _printf
    add esp, 4
    push str_1
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
    je if_then_1
    jmp if_else_1
if_then_1:
    cmp dword [var_rand_state_2], 0
    jne rand_init_2
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_2], eax
rand_init_2:
    mov eax, dword [var_rand_state_2]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_2]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_2], eax
    mov dword [var_rand_state_2], eax
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
    je if_then_3
    jmp if_else_3
if_then_3:
    push str_3
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, 2
    mov dword [var_multiplier], eax
    jmp if_end_3
if_else_3:
if_end_3:
    mov eax, dword [var_eventtype]
    mov ebx, 2
    cmp eax, ebx
    je if_then_4
    jmp if_else_4
if_then_4:
    cmp dword [var_rand_state_5], 0
    jne rand_init_5
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_5], eax
rand_init_5:
    mov eax, dword [var_rand_state_5]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_5]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_5], eax
    mov dword [var_rand_state_5], eax
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
    push str_4
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_4
if_else_4:
if_end_4:
    mov eax, dword [var_eventtype]
    mov ebx, 3
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
    push str_5
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_6
if_else_6:
if_end_6:
    mov eax, dword [var_eventtype]
    mov ebx, 4
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
    push str_6
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_8
if_else_8:
if_end_8:
    mov eax, dword [var_eventtype]
    mov ebx, 5
    cmp eax, ebx
    je if_then_10
    jmp if_else_10
if_then_10:
    push str_1
    call _printf
    add esp, 4
    push str_7
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, 3
    mov dword [var_multiplier], eax
    jmp if_end_10
if_else_10:
if_end_10:
    mov eax, 0
    mov dword [var_eventcounter], eax
    jmp if_end_1
if_else_1:
if_end_1:
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
    je if_then_11
    jmp if_else_11
if_then_11:
    push dword [var_level]
    push dword [var_bosshp]
    push dword [var_bossalive]
    call _spawnboss
    add esp, 12
    mov eax, 0
    mov dword [var_bossready], eax
    jmp if_end_11
if_else_11:
if_end_11:
    push dword [var_totalcollect]
    push dword [var_gold]
    push dword [var_stone]
    push dword [var_wood]
    push dword [var_prestigebonus]
    push dword [var_basecollect]
    push dword [var_multiplier]
    push dword [var_autocollect]
    call _autocollectresources
    add esp, 32
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
    push str_8
    call _printf
    add esp, 4
    push var_cmd
    push scanf_fmt_9
    call _scanf
    add esp, 8
    mov eax, dword [var_cmd]
    mov ebx, 1337
    cmp eax, ebx
    je if_then_12
    jmp if_else_12
if_then_12:
    push str_10
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_11
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_12
if_else_12:
if_end_12:
    mov eax, dword [var_cmd]
    mov ebx, 42
    cmp eax, ebx
    je if_then_13
    jmp if_else_13
if_then_13:
    push str_12
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_13
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_13
if_else_13:
if_end_13:
    mov eax, dword [var_cmd]
    mov ebx, 777
    cmp eax, ebx
    je if_then_14
    jmp if_else_14
if_then_14:
    push str_14
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_15
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_14
if_else_14:
if_end_14:
    mov eax, dword [var_cmd]
    mov ebx, 911
    cmp eax, ebx
    je if_then_15
    jmp if_else_15
if_then_15:
    push str_16
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_17
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_15
if_else_15:
if_end_15:
    mov eax, dword [var_cmd]
    mov ebx, 1234
    cmp eax, ebx
    je if_then_16
    jmp if_else_16
if_then_16:
    push str_18
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_19
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1234
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    push 2000
    call _Sleep@4
    jmp if_end_16
if_else_16:
if_end_16:
    mov eax, dword [var_cmd]
    mov ebx, 999
    cmp eax, ebx
    je if_then_17
    jmp if_else_17
if_then_17:
    push str_20
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_21
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_stone]
    push eax
    mov eax, 999
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    push 2000
    call _Sleep@4
    jmp if_end_17
if_else_17:
if_end_17:
    mov eax, dword [var_cmd]
    mov ebx, 314
    cmp eax, ebx
    je if_then_18
    jmp if_else_18
if_then_18:
    push str_22
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_23
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_18
if_else_18:
if_end_18:
    mov eax, dword [var_cmd]
    mov ebx, 404
    cmp eax, ebx
    je if_then_19
    jmp if_else_19
if_then_19:
    push str_24
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_25
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_gold]
    push eax
    mov eax, 404
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 2000
    call _Sleep@4
    jmp if_end_19
if_else_19:
if_end_19:
    mov eax, dword [var_cmd]
    mov ebx, 80085
    cmp eax, ebx
    je if_then_20
    jmp if_else_20
if_then_20:
    push str_26
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_27
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_20
if_else_20:
if_end_20:
    mov eax, dword [var_cmd]
    mov ebx, 12345
    cmp eax, ebx
    je if_then_21
    jmp if_else_21
if_then_21:
    push str_28
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_29
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_21
if_else_21:
if_end_21:
    mov eax, dword [var_cmd]
    mov ebx, 24601
    cmp eax, ebx
    je if_then_22
    jmp if_else_22
if_then_22:
    push str_30
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_31
    call _printf
    add esp, 4
    push str_1
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
    jl if_then_23
    jmp if_else_23
if_then_23:
    mov eax, 750
    mov dword [var_prestigecost], eax
    jmp if_end_23
if_else_23:
if_end_23:
    push 2000
    call _Sleep@4
    jmp if_end_22
if_else_22:
if_end_22:
    mov eax, dword [var_cmd]
    mov ebx, 8675309
    cmp eax, ebx
    je if_then_24
    jmp if_else_24
if_then_24:
    push str_32
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_33
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_24
if_else_24:
if_end_24:
    mov eax, dword [var_cmd]
    mov ebx, 1776
    cmp eax, ebx
    je if_then_25
    jmp if_else_25
if_then_25:
    push str_34
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_35
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_25
if_else_25:
if_end_25:
    mov eax, dword [var_cmd]
    mov ebx, 1984
    cmp eax, ebx
    je if_then_26
    jmp if_else_26
if_then_26:
    push str_36
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_37
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_wood]
    push eax
    mov eax, 1984
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_wood], eax
    push 2000
    call _Sleep@4
    jmp if_end_26
if_else_26:
if_end_26:
    mov eax, dword [var_cmd]
    mov ebx, 2001
    cmp eax, ebx
    je if_then_27
    jmp if_else_27
if_then_27:
    push str_38
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_39
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_stone]
    push eax
    mov eax, 2001
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_stone], eax
    push 2000
    call _Sleep@4
    jmp if_end_27
if_else_27:
if_end_27:
    mov eax, dword [var_cmd]
    mov ebx, 2112
    cmp eax, ebx
    je if_then_28
    jmp if_else_28
if_then_28:
    push str_40
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_41
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_gold]
    push eax
    mov eax, 2112
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_gold], eax
    push 2000
    call _Sleep@4
    jmp if_end_28
if_else_28:
if_end_28:
    mov eax, dword [var_cmd]
    mov ebx, 1492
    cmp eax, ebx
    je if_then_29
    jmp if_else_29
if_then_29:
    push str_42
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_43
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_29
if_else_29:
if_end_29:
    mov eax, dword [var_cmd]
    mov ebx, 1066
    cmp eax, ebx
    je if_then_30
    jmp if_else_30
if_then_30:
    push str_44
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_45
    call _printf
    add esp, 4
    push str_1
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
    push 2000
    call _Sleep@4
    jmp if_end_30
if_else_30:
if_end_30:
    mov eax, dword [var_cmd]
    mov ebx, 69
    cmp eax, ebx
    je if_then_31
    jmp if_else_31
if_then_31:
    push str_46
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_47
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
    jmp if_end_31
if_else_31:
if_end_31:
    mov eax, dword [var_cmd]
    mov ebx, 68
    cmp eax, ebx
    je if_then_32
    jmp if_else_32
if_then_32:
    push str_48
    call _printf
    add esp, 4
    push str_1
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
    jmp if_end_32
if_else_32:
if_end_32:
    mov eax, dword [var_cmd]
    mov ebx, 420
    cmp eax, ebx
    je if_then_33
    jmp if_else_33
if_then_33:
    push str_49
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_50
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
    jmp if_end_33
if_else_33:
if_end_33:
    mov eax, dword [var_cmd]
    mov ebx, 67
    cmp eax, ebx
    je if_then_34
    jmp if_else_34
if_then_34:
    push str_46
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_51
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
    jmp if_end_34
if_else_34:
if_end_34:
    mov eax, dword [var_cmd]
    mov ebx, 1
    cmp eax, ebx
    je if_then_35
    jmp if_else_35
if_then_35:
    push str_52
    call _printf
    add esp, 4
    push str_1
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
    cmp dword [var_rand_state_36], 0
    jne rand_init_36
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_36], eax
rand_init_36:
    mov eax, dword [var_rand_state_36]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_36]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_36], eax
    mov dword [var_rand_state_36], eax
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
    je if_then_37
    jmp if_else_37
if_then_37:
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
    push str_53
    call _printf
    add esp, 8
    jmp if_end_37
if_else_37:
if_end_37:
    mov eax, dword [var_resourcetype]
    mov ebx, 2
    cmp eax, ebx
    je if_then_38
    jmp if_else_38
if_then_38:
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
    push str_54
    call _printf
    add esp, 8
    jmp if_end_38
if_else_38:
if_end_38:
    mov eax, dword [var_resourcetype]
    mov ebx, 3
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
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_collectamount]
    pop ebx
    add ebx, dword [var_collectamount]
    mov eax, ebx
    mov dword [var_gold], eax
    push dword [var_collectamount]
    push str_55
    call _printf
    add esp, 8
    jmp if_end_39
if_else_39:
if_end_39:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_firstcollect]
    mov ebx, 0
    cmp eax, ebx
    je if_then_40
    jmp if_else_40
if_then_40:
    mov eax, dword [var_hascollected]
    mov ebx, 1
    cmp eax, ebx
    je if_then_41
    jmp if_else_41
if_then_41:
    mov eax, 1
    mov dword [var_firstcollect], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_56
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_41
if_else_41:
if_end_41:
    jmp if_end_40
if_else_40:
if_end_40:
    jmp if_end_35
if_else_35:
if_end_35:
    mov eax, dword [var_cmd]
    mov ebx, 2
    cmp eax, ebx
    je if_then_42
    jmp if_else_42
if_then_42:
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
    jg if_then_43
    jmp if_else_43
if_then_43:
    mov eax, dword [var_stone]
    mov ebx, dword [var_requiredstone]
    cmp eax, ebx
    jg if_then_44
    jmp if_else_44
if_then_44:
    mov eax, dword [var_gold]
    mov ebx, dword [var_requiredgold]
    cmp eax, ebx
    jg if_then_45
    jmp if_else_45
if_then_45:
    mov eax, 1
    mov dword [var_canupgrade], eax
    jmp if_end_45
if_else_45:
if_end_45:
    jmp if_end_44
if_else_44:
if_end_44:
    jmp if_end_43
if_else_43:
if_end_43:
    mov eax, dword [var_wood]
    mov ebx, dword [var_requiredwood]
    cmp eax, ebx
    je if_then_46
    jmp if_else_46
if_then_46:
    mov eax, dword [var_stone]
    mov ebx, dword [var_requiredstone]
    cmp eax, ebx
    je if_then_47
    jmp if_else_47
if_then_47:
    mov eax, dword [var_gold]
    mov ebx, dword [var_requiredgold]
    cmp eax, ebx
    je if_then_48
    jmp if_else_48
if_then_48:
    mov eax, 1
    mov dword [var_canupgrade], eax
    jmp if_end_48
if_else_48:
if_end_48:
    jmp if_end_47
if_else_47:
if_end_47:
    jmp if_end_46
if_else_46:
if_end_46:
    mov eax, dword [var_canupgrade]
    mov ebx, 1
    cmp eax, ebx
    je if_then_49
    jmp if_else_49
if_then_49:
    push str_57
    call _printf
    add esp, 4
    push str_1
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
    push str_58
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_level5]
    mov ebx, 0
    cmp eax, ebx
    je if_then_50
    jmp if_else_50
if_then_50:
    mov eax, dword [var_level]
    mov ebx, 4
    cmp eax, ebx
    jg if_then_51
    jmp if_else_51
if_then_51:
    mov eax, 1
    mov dword [var_level5], eax
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
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_51
if_else_51:
if_end_51:
    jmp if_end_50
if_else_50:
if_end_50:
    mov eax, dword [var_level10]
    mov ebx, 0
    cmp eax, ebx
    je if_then_52
    jmp if_else_52
if_then_52:
    mov eax, dword [var_level]
    mov ebx, 9
    cmp eax, ebx
    jg if_then_53
    jmp if_else_53
if_then_53:
    mov eax, 1
    mov dword [var_level10], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_60
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_53
if_else_53:
if_end_53:
    jmp if_end_52
if_else_52:
if_end_52:
    mov eax, dword [var_level20]
    mov ebx, 0
    cmp eax, ebx
    je if_then_54
    jmp if_else_54
if_then_54:
    mov eax, dword [var_level]
    mov ebx, 19
    cmp eax, ebx
    jg if_then_55
    jmp if_else_55
if_then_55:
    mov eax, 1
    mov dword [var_level20], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_61
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_55
if_else_55:
if_end_55:
    jmp if_end_54
if_else_54:
if_end_54:
    mov eax, dword [var_level50]
    mov ebx, 0
    cmp eax, ebx
    je if_then_56
    jmp if_else_56
if_then_56:
    mov eax, dword [var_level]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_57
    jmp if_else_57
if_then_57:
    mov eax, 1
    mov dword [var_level50], eax
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
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_57
if_else_57:
if_end_57:
    jmp if_end_56
if_else_56:
if_end_56:
    mov eax, dword [var_shopaholic]
    mov ebx, 0
    cmp eax, ebx
    je if_then_58
    jmp if_else_58
if_then_58:
    mov eax, dword [var_level]
    mov ebx, 2
    cmp eax, ebx
    jg if_then_59
    jmp if_else_59
if_then_59:
    mov eax, 1
    mov dword [var_shopaholic], eax
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
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_59
if_else_59:
if_end_59:
    jmp if_end_58
if_else_58:
if_end_58:
    mov eax, dword [var_speedrunner]
    mov ebx, 0
    cmp eax, ebx
    je if_then_60
    jmp if_else_60
if_then_60:
    mov eax, dword [var_level]
    mov ebx, 4
    cmp eax, ebx
    jg if_then_61
    jmp if_else_61
if_then_61:
    mov eax, dword [var_turn]
    mov ebx, 21
    cmp eax, ebx
    jl if_then_62
    jmp if_else_62
if_then_62:
    mov eax, 1
    mov dword [var_speedrunner], eax
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
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_62
if_else_62:
if_end_62:
    jmp if_end_61
if_else_61:
if_end_61:
    jmp if_end_60
if_else_60:
if_end_60:
    jmp if_end_49
if_else_49:
    push str_65
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_requiredgold]
    push dword [var_requiredstone]
    push dword [var_requiredwood]
    push str_66
    call _printf
    add esp, 16
    push str_1
    call _printf
    add esp, 4
if_end_49:
    jmp if_end_42
if_else_42:
if_end_42:
    mov eax, dword [var_cmd]
    mov ebx, 3
    cmp eax, ebx
    je if_then_63
    jmp if_else_63
if_then_63:
    call _clearscreen
    push str_67
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_wood]
    push str_68
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_stone]
    push str_69
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_gold]
    push str_70
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_level]
    push str_71
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_autocollect]
    push str_72
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_upgradecost]
    push str_73
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigelevel]
    push str_74
    call _printf
    add esp, 8
    push dword [var_prestigebonus]
    push str_75
    call _printf
    add esp, 8
    push dword [var_prestigecost]
    push str_76
    call _printf
    add esp, 8
    push str_1
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
    push str_77
    call _printf
    add esp, 16
    push str_1
    call _printf
    add esp, 4
    push dword [var_multiplier]
    push str_78
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_achievements]
    push str_79
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push 1000
    call _Sleep@4
    jmp if_end_63
if_else_63:
if_end_63:
    mov eax, dword [var_cmd]
    mov ebx, 4
    cmp eax, ebx
    je if_then_64
    jmp if_else_64
if_then_64:
    call _clearscreen
    push str_80
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_upgradecost]
    push eax
    mov eax, 2
    pop ebx
    imul ebx, eax
    mov eax, ebx
    mov dword [var_boostcost], eax
    mov eax, dword [var_upgradecost]
    mov dword [var_shopstone], eax
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
    mov dword [var_shopgold], eax
    mov eax, dword [var_upgradecost]
    mov dword [var_shopwood], eax
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
    push dword [var_boostcost]
    push str_81
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_shopgold]
    push dword [var_shopstone]
    push str_82
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
    push dword [var_shopgold]
    push dword [var_shopwood]
    push str_83
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
    push str_84
    call _printf
    add esp, 4
    push dword [var_prestigecost]
    push str_85
    call _printf
    add esp, 8
    push dword [var_prestigecost]
    push dword [var_currenttotal]
    push str_86
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
    push str_87
    call _printf
    add esp, 4
    push var_choice
    push scanf_fmt_88
    call _scanf
    add esp, 8
    mov eax, dword [var_choice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_65
    jmp if_else_65
if_then_65:
    mov eax, dword [var_gold]
    mov ebx, dword [var_boostcost]
    cmp eax, ebx
    jg if_then_66
    jmp if_else_66
if_then_66:
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
    push str_89
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    jmp if_end_66
if_else_66:
    mov eax, dword [var_gold]
    mov ebx, dword [var_boostcost]
    cmp eax, ebx
    je if_then_67
    jmp if_else_67
if_then_67:
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
    push str_89
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    jmp if_end_67
if_else_67:
    push str_90
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
if_end_67:
if_end_66:
    jmp if_end_65
if_else_65:
if_end_65:
    mov eax, dword [var_choice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_68
    jmp if_else_68
if_then_68:
    mov eax, 0
    mov dword [var_canbuy], eax
    mov eax, dword [var_stone]
    mov ebx, dword [var_shopstone]
    cmp eax, ebx
    jg if_then_69
    jmp if_else_69
if_then_69:
    mov eax, dword [var_gold]
    mov ebx, dword [var_shopgold]
    cmp eax, ebx
    jg if_then_70
    jmp if_else_70
if_then_70:
    mov eax, 1
    mov dword [var_canbuy], eax
    jmp if_end_70
if_else_70:
if_end_70:
    jmp if_end_69
if_else_69:
if_end_69:
    mov eax, dword [var_stone]
    mov ebx, dword [var_shopstone]
    cmp eax, ebx
    je if_then_71
    jmp if_else_71
if_then_71:
    mov eax, dword [var_gold]
    mov ebx, dword [var_shopgold]
    cmp eax, ebx
    je if_then_72
    jmp if_else_72
if_then_72:
    mov eax, 1
    mov dword [var_canbuy], eax
    jmp if_end_72
if_else_72:
if_end_72:
    jmp if_end_71
if_else_71:
if_end_71:
    mov eax, dword [var_canbuy]
    mov ebx, 1
    cmp eax, ebx
    je if_then_73
    jmp if_else_73
if_then_73:
    mov eax, dword [var_stone]
    push eax
    mov eax, dword [var_shopstone]
    pop ebx
    sub ebx, dword [var_shopstone]
    mov eax, ebx
    mov dword [var_stone], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_shopgold]
    pop ebx
    sub ebx, dword [var_shopgold]
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
    push str_91
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_73
if_else_73:
    push dword [var_shopgold]
    push dword [var_shopstone]
    push str_92
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
if_end_73:
    jmp if_end_68
if_else_68:
if_end_68:
    mov eax, dword [var_choice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_74
    jmp if_else_74
if_then_74:
    mov eax, 0
    mov dword [var_canbuy], eax
    mov eax, dword [var_wood]
    mov ebx, dword [var_shopwood]
    cmp eax, ebx
    jg if_then_75
    jmp if_else_75
if_then_75:
    mov eax, dword [var_gold]
    mov ebx, dword [var_shopgold]
    cmp eax, ebx
    jg if_then_76
    jmp if_else_76
if_then_76:
    mov eax, 1
    mov dword [var_canbuy], eax
    jmp if_end_76
if_else_76:
if_end_76:
    jmp if_end_75
if_else_75:
if_end_75:
    mov eax, dword [var_wood]
    mov ebx, dword [var_shopwood]
    cmp eax, ebx
    je if_then_77
    jmp if_else_77
if_then_77:
    mov eax, dword [var_gold]
    mov ebx, dword [var_shopgold]
    cmp eax, ebx
    je if_then_78
    jmp if_else_78
if_then_78:
    mov eax, 1
    mov dword [var_canbuy], eax
    jmp if_end_78
if_else_78:
if_end_78:
    jmp if_end_77
if_else_77:
if_end_77:
    mov eax, dword [var_canbuy]
    mov ebx, 1
    cmp eax, ebx
    je if_then_79
    jmp if_else_79
if_then_79:
    mov eax, dword [var_wood]
    push eax
    mov eax, dword [var_shopwood]
    pop ebx
    sub ebx, dword [var_shopwood]
    mov eax, ebx
    mov dword [var_wood], eax
    mov eax, dword [var_gold]
    push eax
    mov eax, dword [var_shopgold]
    pop ebx
    sub ebx, dword [var_shopgold]
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
    push str_93
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_79
if_else_79:
    push dword [var_shopgold]
    push dword [var_shopwood]
    push str_94
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
if_end_79:
    jmp if_end_74
if_else_74:
if_end_74:
    mov eax, dword [var_choice]
    mov ebx, 4
    cmp eax, ebx
    je if_then_80
    jmp if_else_80
if_then_80:
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
    jg if_then_81
    jmp if_else_81
if_then_81:
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
    push str_95
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigelevel]
    push str_74
    call _printf
    add esp, 8
    push dword [var_prestigebonus]
    push str_75
    call _printf
    add esp, 8
    push str_96
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigebonus]
    push str_97
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_81
if_else_81:
    mov eax, dword [var_totalresources]
    mov ebx, dword [var_prestigecost]
    cmp eax, ebx
    je if_then_82
    jmp if_else_82
if_then_82:
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
    push str_95
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigelevel]
    push str_74
    call _printf
    add esp, 8
    push dword [var_prestigebonus]
    push str_75
    call _printf
    add esp, 8
    push str_96
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigebonus]
    push str_97
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_82
if_else_82:
    push str_98
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_totalresources]
    push dword [var_prestigecost]
    push str_99
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
if_end_82:
if_end_81:
    jmp if_end_80
if_else_80:
if_end_80:
    push 1000
    call _Sleep@4
    jmp if_end_64
if_else_64:
if_end_64:
    mov eax, dword [var_cmd]
    mov ebx, 5
    cmp eax, ebx
    je if_then_83
    jmp if_else_83
if_then_83:
    call _clearscreen
    push dword [var_achievements]
    push str_100
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_firstcollect]
    mov ebx, 1
    cmp eax, ebx
    je if_then_84
    jmp if_else_84
if_then_84:
    push str_101
    call _printf
    add esp, 4
    jmp if_end_84
if_else_84:
    push str_102
    call _printf
    add esp, 4
if_end_84:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_level5]
    mov ebx, 1
    cmp eax, ebx
    je if_then_85
    jmp if_else_85
if_then_85:
    push str_103
    call _printf
    add esp, 4
    jmp if_end_85
if_else_85:
    push str_104
    call _printf
    add esp, 4
if_end_85:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_level10]
    mov ebx, 1
    cmp eax, ebx
    je if_then_86
    jmp if_else_86
if_then_86:
    push str_105
    call _printf
    add esp, 4
    jmp if_end_86
if_else_86:
    push str_106
    call _printf
    add esp, 4
if_end_86:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_level20]
    mov ebx, 1
    cmp eax, ebx
    je if_then_87
    jmp if_else_87
if_then_87:
    push str_107
    call _printf
    add esp, 4
    jmp if_end_87
if_else_87:
    push str_108
    call _printf
    add esp, 4
if_end_87:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_level50]
    mov ebx, 1
    cmp eax, ebx
    je if_then_88
    jmp if_else_88
if_then_88:
    push str_109
    call _printf
    add esp, 4
    jmp if_end_88
if_else_88:
    push str_110
    call _printf
    add esp, 4
if_end_88:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_rich]
    mov ebx, 1
    cmp eax, ebx
    je if_then_89
    jmp if_else_89
if_then_89:
    push str_111
    call _printf
    add esp, 4
    jmp if_end_89
if_else_89:
    push str_112
    call _printf
    add esp, 4
if_end_89:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_wealthy]
    mov ebx, 1
    cmp eax, ebx
    je if_then_90
    jmp if_else_90
if_then_90:
    push str_113
    call _printf
    add esp, 4
    jmp if_end_90
if_else_90:
    push str_114
    call _printf
    add esp, 4
if_end_90:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_millionaire]
    mov ebx, 1
    cmp eax, ebx
    je if_then_91
    jmp if_else_91
if_then_91:
    push str_115
    call _printf
    add esp, 4
    jmp if_end_91
if_else_91:
    push str_116
    call _printf
    add esp, 4
if_end_91:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_woodmaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_92
    jmp if_else_92
if_then_92:
    push str_117
    call _printf
    add esp, 4
    jmp if_end_92
if_else_92:
    push str_118
    call _printf
    add esp, 4
if_end_92:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_stonemaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_93
    jmp if_else_93
if_then_93:
    push str_119
    call _printf
    add esp, 4
    jmp if_end_93
if_else_93:
    push str_120
    call _printf
    add esp, 4
if_end_93:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_goldmaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_94
    jmp if_else_94
if_then_94:
    push str_121
    call _printf
    add esp, 4
    jmp if_end_94
if_else_94:
    push str_122
    call _printf
    add esp, 4
if_end_94:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_woodtycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_95
    jmp if_else_95
if_then_95:
    push str_123
    call _printf
    add esp, 4
    jmp if_end_95
if_else_95:
    push str_124
    call _printf
    add esp, 4
if_end_95:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_stonetycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_96
    jmp if_else_96
if_then_96:
    push str_125
    call _printf
    add esp, 4
    jmp if_end_96
if_else_96:
    push str_126
    call _printf
    add esp, 4
if_end_96:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_goldtycoon]
    mov ebx, 1
    cmp eax, ebx
    je if_then_97
    jmp if_else_97
if_then_97:
    push str_127
    call _printf
    add esp, 4
    jmp if_end_97
if_else_97:
    push str_128
    call _printf
    add esp, 4
if_end_97:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_speedrunner]
    mov ebx, 1
    cmp eax, ebx
    je if_then_98
    jmp if_else_98
if_then_98:
    push str_129
    call _printf
    add esp, 4
    jmp if_end_98
if_else_98:
    push str_130
    call _printf
    add esp, 4
if_end_98:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_shopaholic]
    mov ebx, 1
    cmp eax, ebx
    je if_then_99
    jmp if_else_99
if_then_99:
    push str_131
    call _printf
    add esp, 4
    jmp if_end_99
if_else_99:
    push str_132
    call _printf
    add esp, 4
if_end_99:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_minigamemaster]
    mov ebx, 1
    cmp eax, ebx
    je if_then_100
    jmp if_else_100
if_then_100:
    push str_133
    call _printf
    add esp, 4
    jmp if_end_100
if_else_100:
    push str_134
    call _printf
    add esp, 4
if_end_100:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_eventexplorer]
    mov ebx, 1
    cmp eax, ebx
    je if_then_101
    jmp if_else_101
if_then_101:
    push str_135
    call _printf
    add esp, 4
    jmp if_end_101
if_else_101:
    push str_136
    call _printf
    add esp, 4
if_end_101:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_turnveteran]
    mov ebx, 1
    cmp eax, ebx
    je if_then_102
    jmp if_else_102
if_then_102:
    push str_137
    call _printf
    add esp, 4
    jmp if_end_102
if_else_102:
    push str_138
    call _printf
    add esp, 4
if_end_102:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_collectoraddict]
    mov ebx, 1
    cmp eax, ebx
    je if_then_103
    jmp if_else_103
if_then_103:
    push str_139
    call _printf
    add esp, 4
    jmp if_end_103
if_else_103:
    push str_140
    call _printf
    add esp, 4
if_end_103:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_ironfist]
    mov ebx, 1
    cmp eax, ebx
    je if_then_104
    jmp if_else_104
if_then_104:
    push str_141
    call _printf
    add esp, 4
    jmp if_end_104
if_else_104:
    push str_142
    call _printf
    add esp, 4
if_end_104:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_collectorpro]
    mov ebx, 1
    cmp eax, ebx
    je if_then_105
    jmp if_else_105
if_then_105:
    push str_143
    call _printf
    add esp, 4
    jmp if_end_105
if_else_105:
    push str_144
    call _printf
    add esp, 4
if_end_105:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_ultrarich]
    mov ebx, 1
    cmp eax, ebx
    je if_then_106
    jmp if_else_106
if_then_106:
    push str_145
    call _printf
    add esp, 4
    jmp if_end_106
if_else_106:
    push str_146
    call _printf
    add esp, 4
if_end_106:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_grinder]
    mov ebx, 1
    cmp eax, ebx
    je if_then_107
    jmp if_else_107
if_then_107:
    push str_147
    call _printf
    add esp, 4
    jmp if_end_107
if_else_107:
    push str_148
    call _printf
    add esp, 4
if_end_107:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_hoarder]
    mov ebx, 1
    cmp eax, ebx
    je if_then_108
    jmp if_else_108
if_then_108:
    push str_149
    call _printf
    add esp, 4
    jmp if_end_108
if_else_108:
    push str_150
    call _printf
    add esp, 4
if_end_108:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_unstoppable]
    mov ebx, 1
    cmp eax, ebx
    je if_then_109
    jmp if_else_109
if_then_109:
    push str_151
    call _printf
    add esp, 4
    jmp if_end_109
if_else_109:
    push str_152
    call _printf
    add esp, 4
if_end_109:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_eventlegend]
    mov ebx, 1
    cmp eax, ebx
    je if_then_110
    jmp if_else_110
if_then_110:
    push str_153
    call _printf
    add esp, 4
    jmp if_end_110
if_else_110:
    push str_154
    call _printf
    add esp, 4
if_end_110:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_jackpot]
    mov ebx, 1
    cmp eax, ebx
    je if_then_111
    jmp if_else_111
if_then_111:
    push str_155
    call _printf
    add esp, 4
    jmp if_end_111
if_else_111:
    push str_156
    call _printf
    add esp, 4
if_end_111:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_dedicated]
    mov ebx, 1
    cmp eax, ebx
    je if_then_112
    jmp if_else_112
if_then_112:
    push str_157
    call _printf
    add esp, 4
    jmp if_end_112
if_else_112:
    push str_158
    call _printf
    add esp, 4
if_end_112:
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_maxedout]
    mov ebx, 1
    cmp eax, ebx
    je if_then_113
    jmp if_else_113
if_then_113:
    push str_159
    call _printf
    add esp, 4
    jmp if_end_113
if_else_113:
    push str_160
    call _printf
    add esp, 4
if_end_113:
    push str_1
    call _printf
    add esp, 4
    push 3000
    call _Sleep@4
    jmp if_end_83
if_else_83:
if_end_83:
    mov eax, dword [var_cmd]
    mov ebx, 6
    cmp eax, ebx
    je if_then_114
    jmp if_else_114
if_then_114:
    call _clearscreen
    push str_161
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_162
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_163
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_164
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_165
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_166
    call _printf
    add esp, 4
    push var_gamechoice
    push scanf_fmt_167
    call _scanf
    add esp, 8
    mov eax, dword [var_gamechoice]
    mov ebx, 1
    cmp eax, ebx
    je if_then_115
    jmp if_else_115
if_then_115:
    call _clearscreen
    push str_168
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_169
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_170
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    cmp dword [var_rand_state_116], 0
    jne rand_init_116
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_116], eax
rand_init_116:
    mov eax, dword [var_rand_state_116]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_116]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_116], eax
    mov dword [var_rand_state_116], eax
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
    push str_171
    call _printf
    add esp, 4
    push var_guess
    push scanf_fmt_172
    call _scanf
    add esp, 8
    mov eax, dword [var_guess]
    mov ebx, dword [var_secretnumber]
    cmp eax, ebx
    je if_then_117
    jmp if_else_117
if_then_117:
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
    push str_173
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_174
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_117
if_else_117:
    push dword [var_secretnumber]
    push str_175
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_176
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
if_end_117:
    push 1500
    call _Sleep@4
    jmp if_end_115
if_else_115:
if_end_115:
    mov eax, dword [var_gamechoice]
    mov ebx, 2
    cmp eax, ebx
    je if_then_118
    jmp if_else_118
if_then_118:
    call _clearscreen
    push str_177
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_178
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_179
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_180
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_minigameplays]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_minigameplays], eax
    cmp dword [var_rand_state_119], 0
    jne rand_init_119
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_119], eax
rand_init_119:
    mov eax, dword [var_rand_state_119]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_119]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_119], eax
    mov dword [var_rand_state_119], eax
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
    push str_181
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push 5000
    call _Sleep@4
    mov eax, 1
    mov dword [var_round], eax
while_start_120:
    mov eax, dword [var_round]
    mov ebx, 6
    cmp eax, ebx
    jge while_end_120
    call _clearscreen
    push str_177
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_round]
    push str_182
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_streak]
    push str_183
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_184
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_currentcard]
    push str_185
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_186
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_187
    call _printf
    add esp, 4
    push str_188
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_87
    call _printf
    add esp, 4
    push var_playerguess
    push scanf_fmt_189
    call _scanf
    add esp, 8
    call _clearscreen
    push str_177
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_round]
    push str_182
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_184
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_currentcard]
    push str_185
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    cmp dword [var_rand_state_121], 0
    jne rand_init_121
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_121], eax
rand_init_121:
    mov eax, dword [var_rand_state_121]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_121]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_121], eax
    mov dword [var_rand_state_121], eax
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
    push str_190
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_correct], eax
    mov eax, dword [var_playerguess]
    mov ebx, 1
    cmp eax, ebx
    je if_then_122
    jmp if_else_122
if_then_122:
    mov eax, dword [var_nextcard]
    mov ebx, dword [var_currentcard]
    cmp eax, ebx
    jg if_then_123
    jmp if_else_123
if_then_123:
    mov eax, 1
    mov dword [var_correct], eax
    jmp if_end_123
if_else_123:
if_end_123:
    jmp if_end_122
if_else_122:
if_end_122:
    mov eax, dword [var_playerguess]
    mov ebx, 2
    cmp eax, ebx
    je if_then_124
    jmp if_else_124
if_then_124:
    mov eax, dword [var_nextcard]
    mov ebx, dword [var_currentcard]
    cmp eax, ebx
    jl if_then_125
    jmp if_else_125
if_then_125:
    mov eax, 1
    mov dword [var_correct], eax
    jmp if_end_125
if_else_125:
if_end_125:
    jmp if_end_124
if_else_124:
if_end_124:
    mov eax, dword [var_nextcard]
    mov ebx, dword [var_currentcard]
    cmp eax, ebx
    je if_then_126
    jmp if_else_126
if_then_126:
    push str_191
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    jmp if_end_126
if_else_126:
    mov eax, dword [var_correct]
    mov ebx, 1
    cmp eax, ebx
    je if_then_127
    jmp if_else_127
if_then_127:
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
    jg if_then_128
    jmp if_else_128
if_then_128:
    mov eax, dword [var_streak]
    mov dword [var_maxstreak], eax
    jmp if_end_128
if_else_128:
if_end_128:
    push dword [var_streak]
    push str_192
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_127
if_else_127:
    push str_193
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, 0
    mov dword [var_streak], eax
if_end_127:
if_end_126:
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
    jl if_then_129
    jmp if_else_129
if_then_129:
    push str_1
    call _printf
    add esp, 4
    push str_194
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_195
    call _printf
    add esp, 4
    push str_196
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_87
    call _printf
    add esp, 4
    push var_continue
    push scanf_fmt_197
    call _scanf
    add esp, 8
    mov eax, dword [var_continue]
    mov ebx, 2
    cmp eax, ebx
    je if_then_130
    jmp if_else_130
if_then_130:
    mov eax, 6
    mov dword [var_round], eax
    jmp if_end_130
if_else_130:
if_end_130:
    jmp if_end_129
if_else_129:
if_end_129:
    jmp while_start_120
while_end_120:
    call _clearscreen
    push str_198
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_maxstreak]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_131
    jmp if_else_131
if_then_131:
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
    push str_199
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_maxstreak]
    push str_200
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_174
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_131
if_else_131:
    push str_201
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_202
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
if_end_131:
    push str_1
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_118
if_else_118:
if_end_118:
    mov eax, dword [var_gamechoice]
    mov ebx, 3
    cmp eax, ebx
    je if_then_132
    jmp if_else_132
if_then_132:
    call _clearscreen
    push str_203
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_204
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push str_205
    call _printf
    add esp, 4
    push str_1
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
    jg if_then_133
    jmp if_else_133
if_then_133:
    mov eax, 25
    mov dword [var_maxnumber], eax
    jmp if_end_133
if_else_133:
if_end_133:
    mov eax, dword [var_level]
    mov ebx, 25
    cmp eax, ebx
    jg if_then_134
    jmp if_else_134
if_then_134:
    mov eax, 50
    mov dword [var_maxnumber], eax
    jmp if_end_134
if_else_134:
if_end_134:
    mov eax, dword [var_level]
    mov ebx, 50
    cmp eax, ebx
    jg if_then_135
    jmp if_else_135
if_then_135:
    mov eax, 100
    mov dword [var_maxnumber], eax
    jmp if_end_135
if_else_135:
if_end_135:
    mov eax, 1
    mov dword [var_question], eax
while_start_136:
    mov eax, dword [var_question]
    mov ebx, 6
    cmp eax, ebx
    jge while_end_136
    push dword [var_totalquestions]
    push dword [var_question]
    push str_206
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
    cmp dword [var_rand_state_137], 0
    jne rand_init_137
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_137], eax
rand_init_137:
    mov eax, dword [var_rand_state_137]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_137]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_137], eax
    mov dword [var_rand_state_137], eax
    mov ecx, 1
    mov ebx, dword [var_maxnumber]
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_num1], eax
    cmp dword [var_rand_state_138], 0
    jne rand_init_138
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_138], eax
rand_init_138:
    mov eax, dword [var_rand_state_138]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_138]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_138], eax
    mov dword [var_rand_state_138], eax
    mov ecx, 1
    mov ebx, dword [var_maxnumber]
    sub ebx, ecx
    inc ebx
    xor edx, edx
    div ebx
    mov eax, edx
    add eax, ecx
    mov dword [var_num2], eax
    cmp dword [var_rand_state_139], 0
    jne rand_init_139
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_139], eax
rand_init_139:
    mov eax, dword [var_rand_state_139]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_139]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_139], eax
    mov dword [var_rand_state_139], eax
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
    je if_then_140
    jmp if_else_140
if_then_140:
    cmp dword [var_rand_state_141], 0
    jne rand_init_141
    push 0
    call _time
    add esp, 4
    mov dword [var_rand_state_141], eax
rand_init_141:
    mov eax, dword [var_rand_state_141]
    xor eax, eax
    rdtsc
    xor edx, edx
    mov ecx, dword [var_rand_state_141]
    add eax, ecx
    rol eax, 7
    add dword [var_rand_state_141], eax
    mov dword [var_rand_state_141], eax
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
    jmp if_end_140
if_else_140:
if_end_140:
    mov eax, 0
    mov dword [var_correctanswer], eax
    mov eax, dword [var_operation]
    mov ebx, 1
    cmp eax, ebx
    je if_then_142
    jmp if_else_142
if_then_142:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    add ebx, dword [var_num2]
    mov eax, ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_207
    call _printf
    add esp, 12
    jmp if_end_142
if_else_142:
if_end_142:
    mov eax, dword [var_operation]
    mov ebx, 2
    cmp eax, ebx
    je if_then_143
    jmp if_else_143
if_then_143:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    sub ebx, dword [var_num2]
    mov eax, ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_208
    call _printf
    add esp, 12
    jmp if_end_143
if_else_143:
if_end_143:
    mov eax, dword [var_operation]
    mov ebx, 3
    cmp eax, ebx
    je if_then_144
    jmp if_else_144
if_then_144:
    mov eax, dword [var_num1]
    push eax
    mov eax, dword [var_num2]
    pop ebx
    imul ebx, dword [var_num2]
    mov eax, ebx
    mov dword [var_correctanswer], eax
    push dword [var_num2]
    push dword [var_num1]
    push str_209
    call _printf
    add esp, 12
    jmp if_end_144
if_else_144:
if_end_144:
    mov eax, dword [var_operation]
    mov ebx, 4
    cmp eax, ebx
    je if_then_145
    jmp if_else_145
if_then_145:
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
    push str_210
    call _printf
    add esp, 12
    jmp if_end_145
if_else_145:
if_end_145:
    push str_1
    call _printf
    add esp, 4
    push str_211
    call _printf
    add esp, 4
    push var_playeranswer
    push scanf_fmt_212
    call _scanf
    add esp, 8
    mov eax, dword [var_playeranswer]
    mov ebx, dword [var_correctanswer]
    cmp eax, ebx
    je if_then_146
    jmp if_else_146
if_then_146:
    push str_213
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_correctanswers]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_correctanswers], eax
    jmp if_end_146
if_else_146:
    push dword [var_correctanswer]
    push str_214
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
if_end_146:
    mov eax, dword [var_question]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_question], eax
    push 500
    call _Sleep@4
    jmp while_start_136
while_end_136:
    mov eax, dword [var_correctanswers]
    mov ebx, 0
    cmp eax, ebx
    jg if_then_147
    jmp if_else_147
if_then_147:
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
    push str_215
    call _printf
    add esp, 12
    push str_1
    call _printf
    add esp, 4
    push dword [var_reward]
    push str_174
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    jmp if_end_147
if_else_147:
    push dword [var_totalquestions]
    push str_216
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push str_217
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
if_end_147:
    push 1500
    call _Sleep@4
    jmp if_end_132
if_else_132:
if_end_132:
    jmp if_end_114
if_else_114:
if_end_114:
    mov eax, dword [var_cmd]
    mov ebx, 7
    cmp eax, ebx
    je if_then_148
    jmp if_else_148
if_then_148:
    mov eax, dword [var_dailyclaimed]
    mov ebx, 0
    cmp eax, ebx
    je if_then_149
    jmp if_else_149
if_then_149:
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
    push str_218
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_rewardstone]
    push str_219
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_rewardgold]
    push str_220
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    mov eax, 1
    mov dword [var_dailyclaimed], eax
    mov eax, dword [var_dailyclaimed]
    mov ebx, 1
    cmp eax, ebx
    je if_then_150
    jmp if_else_150
if_then_150:
    push str_221
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    jmp if_end_150
if_else_150:
if_end_150:
    push 1500
    call _Sleep@4
    jmp if_end_149
if_else_149:
    push str_222
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 1000
    call _Sleep@4
if_end_149:
    jmp if_end_148
if_else_148:
if_end_148:
    mov eax, dword [var_cmd]
    mov ebx, 8
    cmp eax, ebx
    je if_then_151
    jmp if_else_151
if_then_151:
    mov eax, dword [var_bossalive]
    mov ebx, 0
    cmp eax, ebx
    je if_then_152
    jmp if_else_152
if_then_152:
    push str_223
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
    jmp if_end_152
if_else_152:
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
    push str_224
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    mov eax, dword [var_bosshp]
    mov ebx, 1
    cmp eax, ebx
    jl if_then_153
    jmp if_else_153
if_then_153:
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
    push str_225
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 1500
    call _Sleep@4
    jmp if_end_153
if_else_153:
    push dword [var_bosshp]
    push str_226
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push 800
    call _Sleep@4
if_end_153:
if_end_152:
    jmp if_end_151
if_else_151:
if_end_151:
    mov eax, dword [var_cmd]
    mov ebx, 9
    cmp eax, ebx
    je if_then_154
    jmp if_else_154
if_then_154:
    call _clearscreen
    push str_227
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push dword [var_level]
    push str_71
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_prestigelevel]
    push str_74
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_achievements]
    push str_79
    call _printf
    add esp, 8
    push str_1
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
    push str_228
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_turn]
    push str_229
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    push dword [var_totalcollections]
    push str_230
    call _printf
    add esp, 8
    push str_1
    call _printf
    add esp, 4
    mov eax, 1
    mov dword [var_gameover], eax
    jmp if_end_154
if_else_154:
if_end_154:
    mov eax, dword [var_hascollected]
    mov ebx, 1
    cmp eax, ebx
    je if_then_155
    jmp if_else_155
if_then_155:
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
    je if_then_156
    jmp if_else_156
if_then_156:
    mov eax, dword [var_totalresources]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_157
    jmp if_else_157
if_then_157:
    mov eax, 1
    mov dword [var_rich], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_231
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_157
if_else_157:
if_end_157:
    jmp if_end_156
if_else_156:
if_end_156:
    mov eax, dword [var_wealthy]
    mov ebx, 0
    cmp eax, ebx
    je if_then_158
    jmp if_else_158
if_then_158:
    mov eax, dword [var_totalresources]
    mov ebx, 999
    cmp eax, ebx
    jg if_then_159
    jmp if_else_159
if_then_159:
    mov eax, 1
    mov dword [var_wealthy], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_232
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_159
if_else_159:
if_end_159:
    jmp if_end_158
if_else_158:
if_end_158:
    mov eax, dword [var_millionaire]
    mov ebx, 0
    cmp eax, ebx
    je if_then_160
    jmp if_else_160
if_then_160:
    mov eax, dword [var_totalresources]
    mov ebx, 9999
    cmp eax, ebx
    jg if_then_161
    jmp if_else_161
if_then_161:
    mov eax, 1
    mov dword [var_millionaire], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_233
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_161
if_else_161:
if_end_161:
    jmp if_end_160
if_else_160:
if_end_160:
    mov eax, dword [var_woodmaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_162
    jmp if_else_162
if_then_162:
    mov eax, dword [var_wood]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_163
    jmp if_else_163
if_then_163:
    mov eax, 1
    mov dword [var_woodmaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_234
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_163
if_else_163:
if_end_163:
    jmp if_end_162
if_else_162:
if_end_162:
    mov eax, dword [var_stonemaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_164
    jmp if_else_164
if_then_164:
    mov eax, dword [var_stone]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_165
    jmp if_else_165
if_then_165:
    mov eax, 1
    mov dword [var_stonemaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_235
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_165
if_else_165:
if_end_165:
    jmp if_end_164
if_else_164:
if_end_164:
    mov eax, dword [var_goldmaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_166
    jmp if_else_166
if_then_166:
    mov eax, dword [var_gold]
    mov ebx, 49
    cmp eax, ebx
    jg if_then_167
    jmp if_else_167
if_then_167:
    mov eax, 1
    mov dword [var_goldmaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_236
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_167
if_else_167:
if_end_167:
    jmp if_end_166
if_else_166:
if_end_166:
    mov eax, dword [var_woodtycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_168
    jmp if_else_168
if_then_168:
    mov eax, dword [var_wood]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_169
    jmp if_else_169
if_then_169:
    mov eax, 1
    mov dword [var_woodtycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_237
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_169
if_else_169:
if_end_169:
    jmp if_end_168
if_else_168:
if_end_168:
    mov eax, dword [var_stonetycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_170
    jmp if_else_170
if_then_170:
    mov eax, dword [var_stone]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_171
    jmp if_else_171
if_then_171:
    mov eax, 1
    mov dword [var_stonetycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_238
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_171
if_else_171:
if_end_171:
    jmp if_end_170
if_else_170:
if_end_170:
    mov eax, dword [var_goldtycoon]
    mov ebx, 0
    cmp eax, ebx
    je if_then_172
    jmp if_else_172
if_then_172:
    mov eax, dword [var_gold]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_173
    jmp if_else_173
if_then_173:
    mov eax, 1
    mov dword [var_goldtycoon], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_239
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_173
if_else_173:
if_end_173:
    jmp if_end_172
if_else_172:
if_end_172:
    mov eax, dword [var_minigamemaster]
    mov ebx, 0
    cmp eax, ebx
    je if_then_174
    jmp if_else_174
if_then_174:
    mov eax, dword [var_minigamewins]
    mov ebx, 9
    cmp eax, ebx
    jg if_then_175
    jmp if_else_175
if_then_175:
    mov eax, 1
    mov dword [var_minigamemaster], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_240
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_175
if_else_175:
if_end_175:
    jmp if_end_174
if_else_174:
if_end_174:
    mov eax, dword [var_eventexplorer]
    mov ebx, 0
    cmp eax, ebx
    je if_then_176
    jmp if_else_176
if_then_176:
    mov eax, dword [var_totalevents]
    mov ebx, 19
    cmp eax, ebx
    jg if_then_177
    jmp if_else_177
if_then_177:
    mov eax, 1
    mov dword [var_eventexplorer], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_241
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_177
if_else_177:
if_end_177:
    jmp if_end_176
if_else_176:
if_end_176:
    mov eax, dword [var_turnveteran]
    mov ebx, 0
    cmp eax, ebx
    je if_then_178
    jmp if_else_178
if_then_178:
    mov eax, dword [var_turn]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_179
    jmp if_else_179
if_then_179:
    mov eax, 1
    mov dword [var_turnveteran], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_242
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_179
if_else_179:
if_end_179:
    jmp if_end_178
if_else_178:
if_end_178:
    mov eax, dword [var_collectoraddict]
    mov ebx, 0
    cmp eax, ebx
    je if_then_180
    jmp if_else_180
if_then_180:
    mov eax, dword [var_totalcollections]
    mov ebx, 199
    cmp eax, ebx
    jg if_then_181
    jmp if_else_181
if_then_181:
    mov eax, 1
    mov dword [var_collectoraddict], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_243
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_181
if_else_181:
if_end_181:
    jmp if_end_180
if_else_180:
if_end_180:
    mov eax, dword [var_ironfist]
    mov ebx, 0
    cmp eax, ebx
    je if_then_182
    jmp if_else_182
if_then_182:
    mov eax, dword [var_level]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_183
    jmp if_else_183
if_then_183:
    mov eax, 1
    mov dword [var_ironfist], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_244
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_183
if_else_183:
if_end_183:
    jmp if_end_182
if_else_182:
if_end_182:
    mov eax, dword [var_collectorpro]
    mov ebx, 0
    cmp eax, ebx
    je if_then_184
    jmp if_else_184
if_then_184:
    mov eax, dword [var_totalcollections]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_185
    jmp if_else_185
if_then_185:
    mov eax, 1
    mov dword [var_collectorpro], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_245
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_185
if_else_185:
if_end_185:
    jmp if_end_184
if_else_184:
if_end_184:
    mov eax, dword [var_ultrarich]
    mov ebx, 0
    cmp eax, ebx
    je if_then_186
    jmp if_else_186
if_then_186:
    mov eax, dword [var_totalresources]
    mov ebx, 99999
    cmp eax, ebx
    jg if_then_187
    jmp if_else_187
if_then_187:
    mov eax, 1
    mov dword [var_ultrarich], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_246
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_187
if_else_187:
if_end_187:
    jmp if_end_186
if_else_186:
if_end_186:
    mov eax, dword [var_grinder]
    mov ebx, 0
    cmp eax, ebx
    je if_then_188
    jmp if_else_188
if_then_188:
    mov eax, dword [var_turn]
    mov ebx, 499
    cmp eax, ebx
    jg if_then_189
    jmp if_else_189
if_then_189:
    mov eax, 1
    mov dword [var_grinder], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_247
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_189
if_else_189:
if_end_189:
    jmp if_end_188
if_else_188:
if_end_188:
    mov eax, dword [var_hoarder]
    mov ebx, 0
    cmp eax, ebx
    je if_then_190
    jmp if_else_190
if_then_190:
    mov eax, dword [var_wood]
    mov ebx, 4999
    cmp eax, ebx
    jg if_then_191
    jmp if_else_191
if_then_191:
    mov eax, 1
    mov dword [var_hoarder], eax
    jmp if_end_191
if_else_191:
if_end_191:
    mov eax, dword [var_stone]
    mov ebx, 4999
    cmp eax, ebx
    jg if_then_192
    jmp if_else_192
if_then_192:
    mov eax, 1
    mov dword [var_hoarder], eax
    jmp if_end_192
if_else_192:
if_end_192:
    mov eax, dword [var_gold]
    mov ebx, 4999
    cmp eax, ebx
    jg if_then_193
    jmp if_else_193
if_then_193:
    mov eax, 1
    mov dword [var_hoarder], eax
    jmp if_end_193
if_else_193:
if_end_193:
    mov eax, dword [var_hoarder]
    mov ebx, 1
    cmp eax, ebx
    je if_then_194
    jmp if_else_194
if_then_194:
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_248
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_194
if_else_194:
if_end_194:
    jmp if_end_190
if_else_190:
if_end_190:
    mov eax, dword [var_unstoppable]
    mov ebx, 0
    cmp eax, ebx
    je if_then_195
    jmp if_else_195
if_then_195:
    mov eax, dword [var_minigamewins]
    mov ebx, 24
    cmp eax, ebx
    jg if_then_196
    jmp if_else_196
if_then_196:
    mov eax, 1
    mov dword [var_unstoppable], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_249
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_196
if_else_196:
if_end_196:
    jmp if_end_195
if_else_195:
if_end_195:
    mov eax, dword [var_eventlegend]
    mov ebx, 0
    cmp eax, ebx
    je if_then_197
    jmp if_else_197
if_then_197:
    mov eax, dword [var_totalevents]
    mov ebx, 99
    cmp eax, ebx
    jg if_then_198
    jmp if_else_198
if_then_198:
    mov eax, 1
    mov dword [var_eventlegend], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_250
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_198
if_else_198:
if_end_198:
    jmp if_end_197
if_else_197:
if_end_197:
    mov eax, dword [var_jackpot]
    mov ebx, 0
    cmp eax, ebx
    je if_then_199
    jmp if_else_199
if_then_199:
    mov eax, dword [var_minigamewins]
    mov ebx, 14
    cmp eax, ebx
    jg if_then_200
    jmp if_else_200
if_then_200:
    mov eax, 1
    mov dword [var_jackpot], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_251
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_200
if_else_200:
if_end_200:
    jmp if_end_199
if_else_199:
if_end_199:
    mov eax, dword [var_dedicated]
    mov ebx, 0
    cmp eax, ebx
    je if_then_201
    jmp if_else_201
if_then_201:
    mov eax, dword [var_turn]
    mov ebx, 999
    cmp eax, ebx
    jg if_then_202
    jmp if_else_202
if_then_202:
    mov eax, 1
    mov dword [var_dedicated], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_252
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_202
if_else_202:
if_end_202:
    jmp if_end_201
if_else_201:
if_end_201:
    mov eax, dword [var_maxedout]
    mov ebx, 0
    cmp eax, ebx
    je if_then_203
    jmp if_else_203
if_then_203:
    mov eax, dword [var_level]
    mov ebx, 199
    cmp eax, ebx
    jg if_then_204
    jmp if_else_204
if_then_204:
    mov eax, 1
    mov dword [var_maxedout], eax
    mov eax, dword [var_achievements]
    push eax
    mov eax, 1
    pop ebx
    add ebx, eax
    mov eax, ebx
    mov dword [var_achievements], eax
    push str_253
    call _printf
    add esp, 4
    push str_1
    call _printf
    add esp, 4
    push 2000
    call _Sleep@4
    jmp if_end_204
if_else_204:
if_end_204:
    jmp if_end_203
if_else_203:
if_end_203:
    jmp if_end_155
if_else_155:
if_end_155:
    mov eax, dword [var_gameover]
    mov ebx, 1
    cmp eax, ebx
    je if_then_205
    jmp if_else_205
if_then_205:
    mov eax, 3
    mov esp, ebp
    pop ebp
    ret
    mov eax, 1
    ret
    jmp if_end_205
if_else_205:
if_end_205:
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
    jg if_then_206
    jmp if_else_206
if_then_206:
    mov eax, 0
    mov dword [var_dailyclaimed], eax
    mov eax, 0
    mov dword [var_turn], eax
    jmp if_end_206
if_else_206:
if_end_206:
    push 1000
    call _Sleep@4
    jmp loop_start_0
loop_end_0:
    mov eax, 1
    mov esp, ebp
    pop ebp
    ret
    ret
