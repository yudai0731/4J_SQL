-- evacuation_site 検証用
-- 1 第一正規化
SELECT place.code,place.name,place.kana,place.address,
place.latitude,place.longitude,district.name,
attribute.designation,attribute.wide_area,
flood.suitability,flood_note.note,
sediment_disaster.suitability,sediment_disaster_note.note,
earthquake.suitability,earthquake_note.note,
fire.suitability
FROM place
INNER JOIN district ON district.district_id = place.district_id
INNER JOIN attribute ON attribute.code = place.code
INNER JOIN flood ON flood.code = place.code
INNER JOIN sediment_disaster ON sediment_disaster.code = place.code
INNER JOIN earthquake ON earthquake.code = place.code
INNER JOIN fire ON fire.code = place.code
INNER JOIN flood_note ON flood_note.flood_note_id = flood.flood_note_id
INNER JOIN sediment_disaster_note ON sediment_disaster_note.sediment_disaster_notes_id = sediment_disaster.sediment_disaster_notes_id
INNER JOIN earthquake_note ON earthquake_note.earthquake_note_id = earthquake.earthquake_note_id
;
-- 2 広域避難場所に指定されている避難場所の番号,名前,所在地区を問い合わせる
SELECT place.code,place.name,district.name
FROM place
INNER JOIN district ON district.district_id = place.district_id
INNER JOIN attribute ON attribute.code = place.code
WHERE attribute.wide_area = "○"
;
-- 3 所在地区が「朝陽」,「豊野」の避難場所の名前,所在地区,各災害の避難の適否を問い合わせる
SELECT place.name,district.name,flood.suitability,sediment_disaster.suitability,earthquake.suitability,fire.suitability
FROM place
INNER JOIN district ON district.district_id = place.district_id
INNER JOIN flood ON flood.code = place.code
INNER JOIN sediment_disaster ON sediment_disaster.code = place.code
INNER JOIN earthquake ON earthquake.code = place.code
INNER JOIN fire ON fire.code = place.code
WHERE district.name = "朝陽" OR district.name = "豊野" 
;

-- 4 避難場所の名前に「学校」が含まれている避難場所について避難場所の名前,所在地区,避難所の属性を問い合わせる
SELECT place.name,district.name,attribute.designation,attribute.wide_area
FROM place
INNER JOIN district ON district.district_id = place.district_id
INNER JOIN attribute ON attribute.code = place.code
WHERE place.name LIKE "%学校%"
;

-- 5 現在地(緯度経度)から最も近い避難場所の名前,住所,緯度,経度を問い合わせる
SELECT place.name,place.address,place.latitude,place.longitude,( 
    6371 * ACOS( 
      COS(RADIANS(36.643133)) * COS(RADIANS(place.LATITUDE)) * COS(RADIANS(place.LONGITUDE) - RADIANS(138.188674))
       + SIN(RADIANS(36.643133)) * SIN(RADIANS(place.LATITUDE))
    )
  ) AS DISTANCE 
FROM place
ORDER BY DISTANCE 
LIMIT 5
;
-- 長野高専 : 36.678011, 138.234185
-- 長野駅 : 36.643133,138.188674