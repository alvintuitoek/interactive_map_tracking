-------------------------------
--Lionel-A
--SIDT IGN 04/2015
-------------------------------

------
-- for TrafiPollu soft.
-- add a table to get edges selected from QGIS client

 DROP TABLE IF EXISTS test.edges_selected ;
 CREATE TABLE test.edges_selected
 AS (
   SELECT 
     edge_id,
     start_node,
     end_node
   FROM
     bdtopo_topological.edge_data
   WHERE
     ST_Intersects(ST_MakePolygon(ST_GeomFromText('{0}', {1})), geom)
    OR
     ST_Contains(ST_MakePolygon(ST_GeomFromText('{0}', {1})), geom) 	
   ORDER BY edge_id
 );

