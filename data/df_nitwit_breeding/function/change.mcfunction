#Getting nitwit parent amount for newborn villagers
execute as @e[type=minecraft:villager,nbt={Age:-24000}] at @s store result score @s df.nitwit_parent_count_temp if entity @e[type=villager,distance=0..2.5,nbt={Age:5999,VillagerData:{profession:"minecraft:nitwit"}}]

execute as @e[type=minecraft:villager,nbt={Age:-24000}] run scoreboard players operation @s df.nitwit_parent_count = @s df.nitwit_parent_count_temp

execute as @e[type=minecraft:villager,nbt={Age:-24000}] at @s store result score @s df.nitwit_parent_count_temp if entity @e[type=villager,distance=0..2.5,nbt={Age:6000,VillagerData:{profession:"minecraft:nitwit"}}]

execute as @e[type=minecraft:villager,nbt={Age:-24000}] run scoreboard players operation @s df.nitwit_parent_count += @s df.nitwit_parent_count_temp

#Setting newborn's random score
execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=0..}] store result score @s df.nitwit_roll run random value 1..20

#DEBUG
#execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=0}] run say MAM 0
#execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=1}] run say MAM 1
#execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=2..}] run say MAM 2

#Setting profession according to random score and parent nitwit parent count
execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=0}] if score @s df.nitwit_roll matches 20 run data merge entity @s {VillagerData:{profession:"minecraft:nitwit"}}
execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=1}] if score @s df.nitwit_roll matches 13.. run data merge entity @s {VillagerData:{profession:"minecraft:nitwit"}}
execute as @e[type=minecraft:villager,nbt={Age:-24000},scores={df.nitwit_parent_count=2..}] if score @s df.nitwit_roll matches 3.. run data merge entity @s {VillagerData:{profession:"minecraft:nitwit"}}

#Scoreboard cleanup
execute as @e[type=minecraft:villager,nbt={Age:-24000}] run scoreboard players reset @s df.nitwit_parent_count_temp
execute as @e[type=minecraft:villager,nbt={Age:-24000}] run scoreboard players reset @s df.nitwit_parent_count
execute as @e[type=minecraft:villager,nbt={Age:-24000}] run scoreboard players reset @s df.nitwit_roll
