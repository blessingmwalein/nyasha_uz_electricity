<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';


export default {
    components: {
        AppLayout,
        Welcome,
    },

    props: ['distributions', 'cities'],

    data() {
        return {
            form: useForm({
                month: '',
            }),
            selectedPlant: null,
        }
    },

    methods: {
        submit() {
            this.form.post(`get-distributions`, {
                onSuccess: () => {
                    this.form.reset();
                    this.selectedPlant = null;
                    this.$emit('refresh');
                }
            });

        },




    }
}

</script>

<template>
    <AppLayout title="Dashboard">
        <header>
            <div class="container-fluid">
                <div class=" pt-6">
                    <div class="row align-items-center">
                        <div class="col-sm col-12">
                            <h1 class="h2 ls-tight">Distribution Plans</h1>
                        </div>
                        <div class="col-sm-auto col-12 mt-4 mt-sm-0">

                        </div>
                    </div>
                </div>
            </div>
        </header>


        <div class="container-fluid mt-4">
            <div class="vstack gap-4">

                <div class="card">
                    <div class="card-header border-bottom d-flex align-items-center">
                        <h5 class="me-auto">Monthly Distributions</h5>

                        <div> <select class="form-select" v-model="form.month">
                                <option>January</option>
                                <option>February</option>
                                <option>March</option>
                                <option>April</option>
                                <option>May</option>
                                <option>June</option>
                                <option>July</option>
                                <option>August</option>
                                <option>September</option>
                                <option>October</option>
                                <option>November </option>
                                <option>December</option>
                            </select></div>

                        <div class="ml-3">
                            <button type="button" @click="submit" class="btn btn-sm btn-primary mr-3 p-3">Get For The Month</button>

                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">City</th>
                                    <th scope="col">Month</th>
                                    <th scope="col">Capacity</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Mse and Rmse</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="plant in distributions">
                                    <td>
                                        <a class="text-heading text-primary-hover font-semibold" href="#">

                                            {{ plant.target_city }}
                                        </a>
                                    </td>
                                    <td>{{ plant.month }}</td>
                                    <td>{{ plant.capacity }}</td>
                                    <td>{{ plant.distribution_status }}</td>


                                    <td>{{ plant.mae }}% , {{ plant.rmse }}%</td>


                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-5"><span class="text-muted text-sm">Showing {{
                        distributions.length
                            }} results found</span></div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
