let on_device_ready _ =
  let d = Dialogs.t () in d#alert "Message ici"
  (fun () ->
    d#confirm "A confirm box in OCaml"
    (fun x ->
      d#prompt ((match x with
      | Ok -> "Ok "
      | Cancel -> "Cancel "
      | Back_button -> "Back button "
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
