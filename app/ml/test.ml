let on_device_ready _ =
  let d = Cordova_dialogs.t () in d#alert "Hello in OCaml"
  (fun () ->
    d#confirm "A confirm box in OCaml"
    (fun x ->
      d#prompt ((match x with
      | Cordova_dialogs.Ok -> "Ok "
      | Cordova_dialogs.Cancel -> "Cancel "
      | Cordova_dialogs.Back_button -> "Back button "
      ) ^ "pressed")
      (fun x -> d#beep 1)
      ~title:"Hello world"
      ()
    )
    ()
  )
  ~title:"Titre"
  ();
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
(Dom_html.handler on_device_ready) Js._false
