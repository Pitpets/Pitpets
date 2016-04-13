# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seed NPC_Shop and Player inventory types
OwnerType.create(name: "player")
OwnerType.create(name: "npc_shop")

# Seed a sample shop and shopkeeper
sk = Shopkeeper.create(first_name: "Lucky", last_name: "McStumpy")
shop = Shop.create(name: "Lucky's Used Weapon Emporium", shopkeeper_id: sk.id)

#Test user accounts
ei = User.create(username: "eihiko",
            email: "oeihiko@gmail.com",
            password: "Hackme00",
            password_confirmation: "Hackme00")
yo = User.create(username: "youko",
            email: "oyouko@gmail.com",
            password: "Hackme00",
            password_confirmation: "Hackme00")

squarb = Breed.create(name: "Squarb", 
             image_url: "/img/pets/squarb.png", 
             max_health: 100,
             strength: 10,
             dexterity: 5,
             defense: 15,
             hunger_rate: 4
            )

Pet.create(name: "Barb", 
		max_health: 100, 
		health: 100, 
		hunger_base: 0, 
		strength: 10, 
		dexterity: 5, 
		defense: 15, 
		breed_id: squarb.id,
		last_fed: DateTime.now,
		owner_id: ei.id)

Pet.create(name: "Henri", 
		max_health: 100, 
		health: 100, 
		hunger_base: 0, 
		strength: 5, 
		dexterity: 5, 
		defense: 20, 
		breed_id: squarb.id,
		last_fed: DateTime.now,
		owner_id: yo.id)

purple_hat = ItemType.create(name: "Purple HAT", durability: 5000, image_url: "https://sp.yimg.com/xj/th?id=OIP.Mbac296a6cbc1dcb40a15147ad500f7d5H0&pid=15.1&P=0&w=300&h=300")

heal = EffectType.create(name: "Heal")
burn = EffectType.create(name: "Burn")
freeze = EffectType.create(name: "Freeze")
poison = EffectType.create(name: "Poison")
food = EffectType.create(name: "Food")

ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

item1 = Item.create(item_type_id: purple_hat.id, durability: 5, expires: nil, inventory_id: shop.inventory.id)
item2 = Item.create(item_type_id: purple_hat.id, durability: 4000, expires: nil, inventory_id: shop.inventory.id)

Item.create_from_item_type(purple_hat.id, {inventory_id: ei.inventory.id})
Item.create_from_item_type(purple_hat.id, {inventory_id: ei.inventory.id})
Item.create_from_item_type(purple_hat.id, {inventory_id: yo.inventory.id})
Item.create_from_item_type(purple_hat.id, {inventory_id: yo.inventory.id})

ItemEffect.create(item_id: item1.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: poison.id, modifier1: 2, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: food.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

ItemEffect.create(item_id: item2.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item2.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item2.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

#Tupperware of Leftovers seed
tupperware_of_leftovers = ItemType.create(name: "Tupperware of Leftovers", durability: 1, image_url: "/resources/items/foods/Tupperware of Leftovers.png")
ItemTypeEffect.create(item_type_id: tupperware_of_leftovers.id, effect_type_id: food.id, modifier1: 40, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: tupperware_of_leftovers.id, effect_type_id: poison.id, modifier1: 3, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

# Seed NPC_Shop and Player inventory types
OwnerType.create(name: "player")
OwnerType.create(name: "npc_shop")

# Seed a sample shop and shopkeeper
sk = Shopkeeper.create(first_name: "Lucky", last_name: "McStumpy")
shop = Shop.create(name: "Lucky's Used Weapon Emporium", shopkeeper_id: sk.id)
Item.create(item_type_id: purple_hat.id, durability: 90, inventory_id: shop.inventory.id )
