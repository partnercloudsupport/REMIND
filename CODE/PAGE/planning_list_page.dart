// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "planning_list_state.dart";

// -- TYPES

class PLANNING_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    PLANNING_LIST_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        super()
    {
        ApplicationState = application_state;
        Data = data;
    }

    // -- OPERATIONS

    PLANNING_LIST_STATE createState(
        )
    {
        return PLANNING_LIST_STATE();
    }
}
