let on_device_ready _ =
  Cordova_dialogs.alert
    "Hello in OCaml"
    ~cb:(
      fun () ->
        Cordova_dialogs.confirm
          "A confirm box in OCaml"
          ~cb:(
            fun x ->
              Cordova_dialogs.prompt
                ((match x with
                | Cordova_dialogs.Ok -> "Ok "
                | Cordova_dialogs.Cancel -> "Cancel "
                | Cordova_dialogs.Back_button -> "Back button "
                ) ^ "pressed")
                ~cb:(fun x -> Cordova_dialogs.beep 10)
              ~title:"Hello world"
              ()
          )
          ()
      )
    ~title:"Titre"
    ();
  ()

let _ =
  Cordova.Event.device_ready on_device_ready
