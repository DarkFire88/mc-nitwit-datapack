#Runs change.mcfunction when a new villager is born
execute if entity @e[type=minecraft:villager,nbt={Age:-24000}] run function df_nitwit_breeding:change
