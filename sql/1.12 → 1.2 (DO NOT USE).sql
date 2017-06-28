
-- This is supposed to be a downgrading patch from 1.12 to 1.2 DB for use with future upgrading transition patches.
-- Apply it on the clean 1.12 DB only, with all latest migrations from /server/sql/migrations

-- * INDEX
-- - 1. Available content 		// Raids, dungeons and battlegrounds  
-- - 2. Game events 			// Available in-game events               
-- - 3. Forbidden items 		// Items which shouldn't be availabe in game  
-- - 4. Stats and quality	 	// Gear and weapons stats and quality changes        
-- - 5. Available loot 			// Drop rates and items availabe for looting 
-- - 6. Vendor items 			// Item list changes for vendos             
-- - 7. Creatures				// NPCs and mobs aren't available in game  
-- - 8. Forbidden quests 		// Not-available quests
-- - 9. Enchants  				// Enchantments changes 
-- - 10. Spells 				// Disable spells

-- * Available content

CREATE TEMPORARY TABLE forbidden_items (entry mediumint);
