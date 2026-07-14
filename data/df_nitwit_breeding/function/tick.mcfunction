#Runs change.mcfunction when a new villager is born near a nitwit
execute as @e[type=minecraft:villager,nbt={Age:-24000}] at @s if entity @e[type=villager,distance=0..2.5,nbt={VillagerData:{profession:"minecraft:nitwit"}}] run function df_nitwit_breeding:change
