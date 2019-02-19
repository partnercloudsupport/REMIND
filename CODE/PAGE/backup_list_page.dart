// -- IMPORTS

import "package:flutter/material.dart";
import "../DATA/data.dart";
import "application_state.dart";
import "backup_list_state.dart";

// -- TYPES

class BACKUP_LIST_PAGE extends StatefulWidget
{
    // -- ATTRIBUTES

    APPLICATION_STATE
        ApplicationState;
    DATA
        Data;

    // -- CONSTRUCTORS

    BACKUP_LIST_PAGE(
        APPLICATION_STATE application_state,
        DATA data
        ) :
        super()
    {
        ApplicationState = application_state;
        Data = data;
    }

    // -- OPERATIONS

    BACKUP_LIST_STATE createState(
        )
    {
        return BACKUP_LIST_STATE();
    }
}
