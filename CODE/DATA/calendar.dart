// -- IMPORTS

import "calendar_course.dart";
import "date.dart";

// -- TYPES

class CALENDAR
{
    // -- ATTRIBUTES

    List<CALENDAR_COURSE>
        CourseList;
    DATE
        CurrentDate;

    // -- CONSTRUCTORS

    CALENDAR(
        )
    {
        CourseList = List<CALENDAR_COURSE>();
        CurrentDate = DATE.GetCurrentDate();
    }
}
