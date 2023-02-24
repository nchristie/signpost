bundle exec erd \
--title="Signpost API\nEntity Relationship Diagram" \
--notation=crowsfoot \
--cluster \
--attributes=primary_keys,foreign_keys,timestamps,inheritance,content \
--filename=docs/automated_erd \
--inheritance=true