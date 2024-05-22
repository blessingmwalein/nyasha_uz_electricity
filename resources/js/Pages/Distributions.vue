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
            searchQuery: '',
            selectedPlant: null,
        }
    },
    mounted() {
        this.initializeForm();
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
        initializeForm() {
            const monthNames = [
                'January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'
            ];
            const currentMonthIndex = new Date().getMonth();
            const monthName = monthNames[currentMonthIndex];
            this.searchQuery = monthName;
            this.form.month = monthName;
        },
        search() {
            this.$inertia.get(`search-month`, {
                month: this.searchQuery
            });
        },

        //get current month set form month to current month
    }
}

</script>

<template>
    <AppLayout title="Dashboard">
        <header>
            <div class="container-fluid">
                <div class=" pt-6">
                    <div class="row align-items-center">
                        <div class="col-8">
                            <h1 class="h2 ls-tight">Distribution Plans</h1>
                        </div>
                        <div class="col-4 mt-4">
                            <div class=" d-flex h-1/2">
                                <select style="height: 50px; width: 200px" class="form-select" v-model="form.month">
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
                                </select>


                                <button type="button" @click="submit"
                                    style="height: 50px; width: 200px;margin-left:20px"
                                    class="btn btn-sm btn-primary mr-3 p-3">Get
                                    Plan</button>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="container-fluid mt-4">
            <div class="vstack gap-4">
                <div class="card">
                    <div class="card-header border-bottom d-flex align-items-center">
                        <div></div>
                        <h5 class="me-auto">Monthly Distributions</h5>
                        <div class="col-6 mt-4 d-flex">
                            <div class=" d-flex h-1/2">
                                <select style="height: 50px; width:300px" class="form-select" v-model="searchQuery">
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
                                </select>


                                <button type="button" @click="search"
                                    style="height: 50px; width: 200px;margin-left:20px"
                                    class="btn btn-sm btn-primary mr-3 p-3">Fetch Month Plan</button>


                            </div>

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
