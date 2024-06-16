/*
 * Copyright (C) 2024  Schmuel Odradek
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * ut-notchfix is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Lomiri.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.4

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'ut-notchfix.schmuel'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    PageStack{
        Page {
            id: page0
            anchors.fill: parent

            header: PageHeader {
                id: header
                title: i18n.tr('Notchfix')
            }

            Column{
                width: parent.width
                height: parent.height - header.height - units.gu(2)
                y: header.height + units.gu(2)


                Text{
                    text: i18n.tr("This Tool will allign the User Interface properly according to the notches of your hardware device.")
                    width: parent.width - units.gu(2)
                    x: units.gu(2)
                    wrapMode: "WordWrap"
                }

            }

            Button {
                width:page0.width * 0.38
                x:page0.width*0.1
                y:page0.height*0.9
                text: i18n.tr("Apply")
                onClicked: print ("Apply")
            }
            Button {
                width:page0.width * 0.38
                y:page0.height*0.9
                x:page0.width-width-page0.width*0.1
                text: i18n.tr("Reset")
                onClicked: print ("Reset")
            }
        }

    }

    Python {
        id: python

        Component.onCompleted: {
            addImportPath(Qt.resolvedUrl('../src/'));

            //importModule('example', function() {
            //    console.log('module imported');
            //    python.call('example.speak', ['Hello World!'], function(returnValue) {
            //        console.log('example.speak returned ' + returnValue);
            //    })
            //});

            importModule("apply", function(){
                console.log("Apply Imported")
            })

            importModule("reset", function(){
                console.log("Apply Imported")
            })
        }

        onError: {
            console.log('python error: ' + traceback);
        }
    }
}
