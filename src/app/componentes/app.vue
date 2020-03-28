<template>
  <div>
    <nav class="navbar navbar-light bg-light">
      <a class="navbar-brand" href="#">Crud-Prueba Zabud</a>
    </nav>

    <div class="container">
      <div class="row pt-5">
        <div class="col-md-5">
          <div class="card">
            <div class="card-body">
              <form @submit.prevent="addcar">
                <div class="form-group text-center">
                  <h3>Formulario De Registro</h3>
                </div>
                <div class="form-group">
                  <input
                    class="form-control md-3"
                    type="text"
                    v-model="car.marca"
                    placeholder="Digita una marca de carro"
                  />
                </div>
                <div class="form-group">
                  <input
                    class="form-control md-3"
                    type="text"
                    v-model="car.modelo"
                    placeholder="Digita un modelo de carro"
                  />
                </div>
                <div class="form-group">
                  <input
                    class="form-control md-3"
                    type="text"
                    v-model="car.color"
                    placeholder="Digita un color de carro"
                  />
                </div>

                <template v-if="edit === false ">
                  <button class="btn btn-success form-control">Registrar</button>
                </template>
                <template v-else>
                  <button class="btn btn-success form-control">Actualizar</button>
                </template>
              </form>
            </div>
          </div>
        </div>
        <div class="col-md-7">
          <table class="table table-striped table-default">
            <thead>
              <tr>
                <th scope="col">Id</th>
                <th scope="col">Marca</th>
                <th scope="col">Modelo</th>
                <th scope="col">Color</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="car of cars">
                <td>{{car.marca}}</td>
                <td>{{car.modelo}}</td>
                <td>{{car.color}}</td>
                <td>
                  <button class="btn btn-danger" @click="deletecar(car.id)">Eliminar</button>
                  <button class="btn btn-warning" @click="updatecar(car.id)">Actualizar</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
class Car {
  constructor(marca, modelo, color) {
    this.id = 0;
    this.marca = marca;
    this.modelo = modelo;
    this.color = color;
  }
}
export default {
  data() {
    return {
      car: new Car(),
      cars: [],
      edit: false,
      caredit: ""
    };
  },

  created() {
    this.getcar();
  },

  methods: {
    getcar() {
      fetch("/api/car")
        .then(res => res.json())
        .then(data => {
          this.cars = data;
          console.log(this.cars);
        });
    },

    addcar() {
      if (this.edit === false) {
        fetch("/api/car", {
          method: "POST",
          body: JSON.stringify(this.car),
          headers: {
            Accept: "application/json",
            "Content-type": "application/json"
          }
        })
          .then(res => res.json())
          .then(data => {
            this.getcar();
          });
      } else {
        fetch("/api/car/" + this.caredit, {
          method: "PUT",
          body: JSON.stringify(this.car),
          headers: {
            Accept: "application/json",
            "Content-type": "application/json"
          }
         
        })
        .then(res => res.json())
        .then(data => {
            this.getcar();
            this.edit = false;
          });
      }
      this.car = new Car();
    },

    deletecar(id) {
      fetch("/api/car/" + id, {
        method: "DELETE",
        body: JSON.stringify(this.car),
        headers: {
          Accept: "application/json",
          "Content-type": "application/json"
        }
      })
        .then(res => res.json())
        .then(data => {
          this.getcar();
        });
    },
    updatecar(id) {
      fetch("/api/car/" + id)
        .then(res => res.json())
        .then(data => {
          this.car = new Car(data.marca, data.modelo, data.color);
          this.caredit = data.id;
          this.edit = true;
        });
    }
  }
};
</script>