

<template>
  <div>
    <div class="row justify-content-center">
      <div class="col-lg-6">
        <div class="card mb-4">
          <form @keydown.enter.prevent @submit.prevent="update">
            <div
              class="
                card-header
                py-3
                d-flex
                flex-row
                align-items-center
                justify-content-between
              "
            >
              <h6 class="m-0 font-weight-bold text-primary">
                تحديث المخزون
              </h6>
              <button class="btn btn-primary" type="submit">حفظ</button>
            </div>
            <div class="card-body">
              <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span id="basic-addon1" class="input-group-text"
                    >الاسم</span
                  >
                </div>
                <input
                  aria-describedby="basic-addon1"
                  aria-label="الاسم "
                  class="form-control"
                  v-model="form.title"
                  placeholder="الاسم "
                  type="text" required
                />
              </div>
              <div class="input-group mb-3">
                <div class="input-group-append">
                  <span id="basic-addon2" class="input-group-text"
                    >المخزون</span
                  >
                </div>
                <input
                  aria-describedby="basic-addon2"
                  aria-label="المخزون"
                  class="form-control"
                  placeholder="المخزون"
                  v-model="form.stock"
                  type="text" required
                />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>



<script type="text/javascript">
export default {
  created() {
  if (!User.loggedIn()) {
            this.$router.push("/");
        }
    let id = this.$route.params.id;
    axios
      .get("/api/stocks/" + id)
      .then(({ data }) => (this.form = data))
      .catch(console.log("error"));
  },

  data() {
    return {
      form: {
        title: "",
        stock: "",
      },

      errors: {},
    };
  },

  methods: {
    update() {
      let id = this.$route.params.id;
      axios
        .patch("/api/stocks/" + id, this.form)
        .then(() => {
          this.$router.push({ name: "stocks" });
          Notification.success();
        })
        .catch((error) => (this.errors = error.response.data.errors));
    },
  },
};
</script>


<style type="text/css">
</style>
