# MySQL

## time

+ [Automatic Initialization and Updating for TIMESTAMP and DATETIME](https://dev.mysql.com/doc/refman/8.0/en/timestamp-initialization.html)

---
# [SQLAlchemy](https://www.sqlalchemy.org/)

## [Column INSERT/UPDATE Defaults](https://docs.sqlalchemy.org/en/20/core/defaults.html)
+ [Marking Implicitly Generated Values, timestamps, and Triggered Columns](https://docs.sqlalchemy.org/en/20/core/defaults.html#marking-implicitly-generated-values-timestamps-and-triggered-columns)
+ [SQLAlchemy default DateTime](https://stackoverflow.com/questions/13370317/sqlalchemy-default-datetime)

```python
from sqlalchemy import Column, DateTime
from sqlalchemy.sql import func

time_created = Column(DateTime(timezone=True), server_default=func.now())
time_updated = Column(DateTime(timezone=True), onupdate=func.now())
```
