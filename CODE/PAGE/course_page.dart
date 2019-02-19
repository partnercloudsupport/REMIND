// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "../DATA/course.dart";
import "application_state.dart";
import "course_state.dart";

// -- TYPES

class COURSE_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;
    COURSE
        Course;

    // -- CONSTRUCTORS

    COURSE_PAGE(
        APPLICATION_STATE application_state,
        DATA data,
        COURSE course
        ) :
        super()
    {
        ApplicationState = application_state;
        Data = data;
        Course = course;
    }

    // -- OPERATIONS

    COURSE_STATE createState(
        )
    {
        return COURSE_STATE();
    }
}
