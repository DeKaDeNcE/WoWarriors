-- 
-- Sabotage the Warp-Gate! (10310)
DELETE FROM `creature_text` WHERE `entry`=20281;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES 
(20281, 0, 0, "Let's proceed at a brisk pace.", 12, 0, 100, 0, 0, 0, 17941, 'Drijya'),
(20281, 1, 0, "We'll start at that first energy pylon, straight ahead. Remember, try to keep them off of me.", 12, 0, 100, 25, 0, 0, 17942,  'Drijya'),
(20281, 2, 0, "I'm done with this pylon. On to the next.", 12, 0, 100, 0, 0, 0, 17943,  'Drijya'),
(20281, 3, 0, "Alright, pylon two down. Now for the heat manifold.", 12, 0, 100, 0, 0, 0, 17944,  'Drijya'),
(20281, 4, 0, "That should do it. The teleporter should blow any second now!", 12, 0, 100, 0, 0, 0, 17945,  'Drijya'),
(20281, 5, 0, "Ok, let's get out of here!", 12, 0, 100, 0, 0, 0, 17946,  'Drijya'),
(20281, 6, 0, "Thank you, $N! I couldn't have done it without you. You'll let Gahruj know?", 12, 0, 100, 0, 0, 0, 17949,  'Drijya'),
(20281, 7, 0, "Keep them off me!", 12, 0, 100, 0, 0, 0, 17950,  'Drijya'),
(20281, 8, 0, "Very well.  Before we head down there, take a moment to prepare yourself.", 12, 0, 100, 0, 0, 0, 17940,  'Drijya');
UPDATE `locales_broadcast_text` SET `MaleText_loc2`="Très bien. Avant de commencer, prenez quelques temps pour vous préparer." WHERE `ID`=17940;

UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN(20281, 20296, 20399, 20402, 20403);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(20296, 20281, 20399, 20402, 20403) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN(20281*100, 20281*100+1, 20281*100+2, 2028103) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(20281, 0, 0, 0, 19, 0, 100, 0, 10310, 0, 0, 0, 80, 2028100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On Quest Accept - Action list'),
(2028100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 19, 256+512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Remove unit Flag'),
(2028100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - remove npc flag'),
(2028100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Talk'),
(2028100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Store target'),
(2028100, 9, 4, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 53, 1, 20281, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Start WP'),
(2028100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Talk'),
(20281, 0, 1, 2, 40, 0, 100, 0, 5, 0, 0, 0, 54, 7000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - WP Pause'),
(20281, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - Talk'),
(20281, 0, 3, 4, 40, 0, 100, 0, 6, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - WP Pause'),
(20281, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 20281*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - Script9'),
(20281, 0, 5, 15, 56, 0, 100, 0, 6, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Resume - Talk'),
(20281, 0, 6, 7, 40, 0, 100, 0, 9, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - WP Pause'),
(20281, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, 20281*100+2, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - Script9'),
(20281, 0, 8, 15, 56, 0, 100, 0, 9, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Resume - Talk'),
(20281, 0, 9, 10, 40, 0, 100, 0, 12, 0, 0, 0, 54, 40000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - WP Pause'),
(20281, 0, 10, 11, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 4, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - WP reached - Set data'),
(20281, 0, 11, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 28, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - WP reached - Set Emote State'),
(20281, 0, 12, 15, 56, 0, 100, 0, 12, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Resume - Talk'),
(20281, 0, 13, 14, 40, 0, 100, 0, 13, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 20296, 100, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - Set Data'),
(20281, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Resume - Talk'),
(20281, 0, 15, 0, 61, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Linked - Remove Emote State'),
(20281, 0, 16, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Drijya - On Aggro - Talk'),
(20281, 0, 17, 0, 40, 0, 100, 0, 16, 0, 0, 0, 80, 2028103, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - On WP Reached - Action list'),
(2028103, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Talk'),
(2028103, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 256+512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Set Flag'),
(2028103, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Set NPC Flag'),
(2028103, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0.174533, 'Drijya - Action list- Orientation'),
(2028103, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 15, 10310, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Drijya - Action list - Credit quest'),
(20281*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 28, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set Emote State'),
(20281*100+1, 9, 1, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 2, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 3, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 4, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 5, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 6, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 7, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+1, 9, 8, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 45, 1, 2, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set data'),
(20281*100+2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 28, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set Emote State'),
(20281*100+2, 9, 1, 0, 0, 0, 100, 1, 7000, 7000, 0, 0, 45, 1, 3, 0, 0, 0, 0, 19, 20296, 50, 0,   0, 0, 0, 0, 'Drijya - Script9 - Set Data'),
(20281*100+2, 9, 2, 0, 0, 0, 100, 1, 10000, 10000, 0, 0, 45, 1, 3, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set Data'),
(20281*100+2, 9, 3, 0, 0, 0, 100, 1, 10000, 10000, 0, 0, 45, 1, 3, 0, 0, 0, 0, 19, 20296, 50, 0, 0, 0, 0, 0, 'Drijya - Script9 - Set Data'),
(20296, 0, 0, 1, 38, 0, 100, 0, 1, 1, 0, 0, 11, 34602, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Teleporter Explosion Trigger - On Data Set - Cast Spell'),
(20296, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 56274, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Teleporter Explosion Trigger - On Data Set - Cast Spell'),
(20296, 0, 2, 0, 38, 0, 100, 0, 1, 2, 0, 0, 11, 35142, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Teleporter Explosion Trigger - On Data Set - Cast Spell'),
(20296, 0, 3, 0, 38, 0, 100, 0, 1, 3, 0, 0, 11, 35145, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Teleporter Explosion Trigger - On Data Set - Cast Spell'),
(20296, 0, 4, 0, 38, 0, 100, 0, 1, 4, 0, 0, 11, 35146, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Teleporter Explosion Trigger - On Data Set - Cast Spell'),
(20399, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 20281, 80, 0, 0, 0, 0, 0, 'Terror ImpJust summoned  - Start attack'),
(20402, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 20281, 80, 0, 0, 0, 0, 0, 'Legion Shocktrooper - Just summoned  - Start attack'),
(20402, 0, 1, 0, 1, 0, 100, 0, 2000, 8000, 10000, 17000, 11, 35144, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Legion Shocktrooper - IC - Cast Vicious Rend'),
(20403, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 19, 20281, 80, 0, 0, 0, 0, 0, 'Just summoned  - Start attack'),
(20403, 0, 1, 0, 0, 0, 100, 0, 2000, 8000, 7000, 10000, 11, 13737, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Legion Destroyer - IC - Cast Mortal Strike'),
(20403, 0, 2, 0, 0, 0, 100, 0, 2000, 5000, 9000, 13000, 11, 11428, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Legion Destroyer - IC  - Cast Knockdown');

DELETE FROM `waypoints` WHERE `entry`=20281;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(20281, 1, 3101.25, 2800.1, 118.565, 'Drijya'),
(20281, 2, 3107.59, 2793.75, 117.902, 'Drijya'),
(20281, 3, 3095.54, 2771.74, 115.836, 'Drijya'),
(20281, 4, 3086.593, 2752.232,115.499, 'Drijya'),
(20281, 5, 3077.952, 2745.1616, 116.63, 'Drijya'),
(20281, 6, 3050.38, 2727.86, 114.118, 'Drijya'),
(20281, 7, 3056.46, 2723.47, 113.688, 'Drijya'),
(20281, 8, 3041.73, 2711.97, 114.028, 'Drijya'),
(20281, 9, 3021.78, 2700.04, 114.08, 'Drijya'),
(20281, 10, 3013.88, 2708.98, 113.785, 'Drijya'),
(20281, 11, 3002, 2718.44, 113.769, 'Drijya'),
(20281, 12, 3009.91, 2728.669, 114.377, 'Drijya'),
(20281, 13, 3017.120, 2729.377, 113.76, 'Drijya'),
(20281, 14, 3086.263, 2764.139, 115.84, 'Drijya'),
(20281, 15, 3100.599, 2794.43, 117.958, 'Drijya'),
(20281, 16, 3096.169, 2801.14, 118.221, 'Drijya');
