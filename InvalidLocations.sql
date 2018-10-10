SELECT
CONCAT('o',order_view.record_num, 'a')
--adds o prefix to the item record number and the "a" as a placeholder for the check digit, so the number can be easily copied and pasted into Sierra

FROM sierra_view.order_view
JOIN sierra_view.order_record_cmf
ON order_view.id = order_record_cmf.order_record_id

WHERE
order_view.record_creation_date_gmt > TIMESTAMP 'yesterday' AND
location_code like 'mhl%'
-- This limits results to any order records updated since midnight of the previous day, that have a location code that starts with "mhl"


