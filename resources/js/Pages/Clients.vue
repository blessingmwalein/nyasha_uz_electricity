<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';


export default {
    components: {
        AppLayout,
        Welcome,
    },

    props: ['clients', 'cities'],

    data() {
        return {
            form: useForm({
                full_name: '',
                email: '',
                phone: '',
                address: '',
                number_of_appliances: 0,
                number_of_residents: 0,
                city_id: null,
                monthly_consumption: 0,
            }),
            selectedClient: null,
        }
    },

    methods: {
        submit() {
            if (this.selectedClient) {
                this.form.put(`clients/${this.selectedClient.id}`, {
                    onSuccess: () => {
                        this.form.reset();
                        this.selectedClient = null;
                        this.$emit('refresh');
                    }
                });
            } else {
                this.form.post('clients', {
                    onSuccess: () => {
                        this.form.reset();
                        this.$emit('refresh');
                    }
                });
            }
        },

        deleteTown(client) {
            this.$inertia.delete(`clients/${client.id}`, {
                onSuccess: () => {
                    this.$emit('refresh');
                }
            });
        },

        edit(client) {
            this.selectedClient = client;
            this.form.full_name = client.full_name;
            this.form.email = client.email;
            this.form.phone = client.phone;
            this.form.address = client.address;
            this.form.number_of_appliances = client.number_of_appliances;
            this.form.number_of_residents = client.number_of_residents;
            this.form.city_id = client.city_id;
            this.form.monthly_consumption = client.monthly_consumption;
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
                            <h1 class="h2 ls-tight">All Clients</h1>
                        </div>
                        <div class="col-sm-auto col-12 mt-4 mt-sm-0">
                            <div class="hstack gap-2 justify-content-sm-end"><a href="#offcanvasCreate"
                                    class="btn btn-sm btn-primary" data-bs-toggle="offcanvas"><span class="pe-2"><i
                                            class="bi bi-plus-square-dotted"></i> </span><span>Create</span></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <div class="offcanvas offcanvas-end w-full w-lg-1/3" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1"
            id="offcanvasCreate" aria-labelledby="offcanvasCreateLabel">
            <div class="offcanvas-header border-bottom py-4 bg-surface-secondary">
                <h5 class="offcanvas-title" id="offcanvasCreateLabel">{{ selectedClient ? 'Update' : 'New' }} Client
                </h5><button type="button" class="btn-close text-reset text-xs" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <form @submit.prevent="submit()">

                <div class="offcanvas-body vstack gap-5">
                    <div class="row g-5">
                        <div class="col-md-6">
                            <div>
                                <label class="form-label">Full Name</label>
                                <input type="text" v-model="form.full_name" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div><label class="form-label">Select City</label>
                                <select class="form-select" v-model="form.city_id" aria-label="Default select example">
                                    <option :value="city.id" v-for="city in cities">{{ city.name }}
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="form-label" for="last_name">Phone</label>
                            <input type="number" v-model="form.phone" class="form-control">

                        </div>
                        <div class="col-md-6">
                            <label class="form-label" for="last_name">Email</label>
                            <input type="email" v-model="form.email" class="form-control">

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-label" for="last_name">Address</label>
                            <textarea name="" class="form-control" id="" v-model="form.address" rows="3"></textarea>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label class="form-label" for="last_name"># of Appliances</label>
                            <input type="number" v-model="form.number_of_appliances" class="form-control">

                        </div>
                        <div class="col-md-4">
                            <label class="form-label" for="last_name"># of Residents</label>
                            <input type="number" v-model="form.number_of_residents" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label" for="last_name">Consumption(KW)</label>
                            <input type="number" v-model="form.monthly_consumption" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer py-2 bg-surface-secondary">
                        <button style="margin-right: 5px;" type="button" class="btn btn-sm btn-neutral"
                            data-bs-dismiss="offcanvas">Close</button>
                        <button style="margin-right: 5px;" type="submit" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing" class="btn btn-sm btn-primary">Save</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="container-fluid mt-4">
            <div class="vstack gap-4">

                <div class="card">
                    <div class="card-header border-bottom d-flex align-items-center">
                        <h5 class="me-auto">All clients</h5>
                        <div class="dropdown"><a class="text-muted" href="#" role="button" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></a>
                            <div class="dropdown-menu"><a href="#!" class="dropdown-item">Action </a><a href="#!"
                                    class="dropdown-item">Another action </a><a href="#!"
                                    class="dropdown-item">Something else here</a></div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">Monthly Consumption</th>
                                    <th scope="col">Residents</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="client in clients">
                                    <td>
                                        <a class="text-heading text-primary-hover font-semibold" href="#">

                                            {{ client.full_name }}
                                        </a>
                                    </td>
                                    <td>{{ client.phone }}</td>
                                    <td>{{ client.address }}</td>


                                    <td>{{ client.monthly_consumption }}KW</td>
                                    <!-- <td>{{ client.number_of_residents }}</td> -->
                                    <td>{{ client.city?.name }}</td>

                                    <td class="text-end">
                                        <a href="#offcanvasCreate" @click="edit(client)" data-bs-toggle="offcanvas"
                                            class="btn btn-sm btn-square btn-neutral"><i class="bi bi-pencil"></i>
                                        </a>

                                        <button type="button" @click="deleteTown(client)"
                                            class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                                class="bi bi-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-5"><span class="text-muted text-sm">Showing {{ clients.length
                            }} results found</span></div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
