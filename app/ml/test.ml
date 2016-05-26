let on_device_ready _ =
  let d = Cordova_dialogs.t () in
  d#alert
    "Hello in OCaml"
    ~cb:(
      fun () ->
        d#confirm
          "A confirm box in OCaml"
          ~cb:(
            fun x ->
              d#prompt
                ((match x with
                | Cordova_dialogs.Ok -> "Ok "
                | Cordova_dialogs.Cancel -> "Cancel "
                | Cordova_dialogs.Back_button -> "Back button "
                ) ^ "pressed")
                ~cb:(fun x -> d#beep 1)
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
