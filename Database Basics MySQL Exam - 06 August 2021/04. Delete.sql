delete from games as g
where not exists (SELECT game_id FROM games_categories as gc WHERE gc.game_id = g.id)
and release_date is null;