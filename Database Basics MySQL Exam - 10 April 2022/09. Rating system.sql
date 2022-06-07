select m.title, (
 CASE 
        WHEN rating <= 4 THEN 'poor'
        WHEN rating > 4 and rating <= 7 THEN 'good'
        WHEN rating > 7 THEN 'excellent'
        ELSE 1
    END
 ) as rating , (CASE 
        WHEN has_subtitles = 1 then 'english'
        ELSE '-'
    END
 ) as subtitles , budget from movies as m
join movies_additional_info as i ON m.movie_info_id = i.id order by budget desc;