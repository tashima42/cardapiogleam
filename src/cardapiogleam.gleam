import gleam/int
import lustre
import lustre/element
import lustre/element/html
// import lustre/event
import lustre/attribute

pub type Model = Int

type Card {
  Card(title: String, description: String)
}

fn init(_flags) -> Model {
  0
}


pub type Msg {
  Increment
  Decrement
}

pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Increment -> model + 1
    Decrement -> model - 1
  }
}

pub fn view(model: Model) -> element.Element(Msg) {
  let count = int.to_string(model)

  html.div([], [
    html.div([attribute.class("navbar bg-base-100 sticky top-0 z-50 border-solid border-b-2 border-primary")], [
      html.button([attribute.class("btn btn-ghost text-xl")], [
        element.text("MOMMY's Cozinha caseira"),
      ]),
    ]),
    html.div([], [
      html.h3([attribute.class("text-2xl font-semibold text-center mt-4")],[
        element.text("Cardápio da semana")
      ]),
      html.div([attribute.class("flex flex-row overflow-auto p-5 justify-center")], [
        top_card("#1", "Arroz, feijão, carne, salada e suco"),
        top_card("#1", "Arroz, feijão, carne, salada e suco"),
        top_card("#1", "Arroz, feijão, carne, salada e suco"),
        top_card("#1", "Arroz, feijão, carne, salada e suco"),
        top_card("#1", "Arroz, feijão, carne, salada e suco"),
      ])
    ]),
    html.div([attribute.class("flex justify-center w-100")], [
      html.div([attribute.class("products grid grid-cols-2 justify-items-center gap-6 w-3/5")], [
        bottom_card("Kit semanal (R$ 60,00)", "Cardápio da semana"),
        bottom_card("Kit semanal (R$ 60,00)", "Cardápio da semana"),
        bottom_card("Kit semanal (R$ 60,00)", "Cardápio da semana"),
        bottom_card("Kit semanal (R$ 60,00)", "Cardápio da semana"),
        bottom_card("Kit semanal (R$ 60,00)", "Cardápio da semana"),
        bottom_card("Kit semanal (R$ 60,00)", "Cardápio da semana"),
      ])
    ])
  ])
}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn top_card(title: String, description: String) -> element.Element(Msg) {
  html.div([attribute.class("card bg-base-100 w-60 shadow-md h-40")], [
    html.div([attribute.class("card-body")], [
      html.h2([attribute.class("card-title text-primary bold")], [
        element.text(title)
      ]),
      html.div([attribute.class("card-actions justify-end")], [
        html.p([], [
          element.text(description)
        ])
      ]),
    ])
  ])
}

fn bottom_card(title: String, description: String) -> element.Element(Msg) {
  html.div([attribute.class("card bg-neutral w-96 shadow-xl")], [
    html.div([attribute.class("card-body")], [
      html.h2([attribute.class("card-title text-primary")], [
        element.text(title)
      ]),
      html.div([attribute.class("card-actions justify-end")], [
        html.p([attribute.class("text-accent")], [
          element.text(description)
        ]),
        html.button([attribute.class("btn btn-primary")], [
          element.text("Pedir")
        ])
      ])
    ])
  ])
}

// fn top_cards(cards: List(Card), index: Int) -> element.Element(Msg) {
//   case index {}
//   html.div([attribute.class("m-2")], [
//     top_card("#1", "Arroz, feijão, carne, salada e suco")
//   ])
// }


