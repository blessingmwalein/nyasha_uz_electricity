<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
</script>

<template>
    <AppLayout title="Dashboard">

        <div class="container-fluid">

            <div class="row g-6 mb-6">
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span
                                        class="h6 font-semibold text-muted text-sm d-block mb-2">Plants</span>
                                    <span class="h3 font-bold mb-0">10</span>
                                </div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-tertiary text-white text-lg rounded-circle">
                                        <i class="bi bi-building-fill-gear"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-success text-success me-2"><i
                                        class="bi bi-arrow-up me-1"></i>30%  </span><span
                                    class="text-nowrap text-xs text-muted">Kilowatts increase</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span class="h6 font-semibold text-muted text-sm d-block mb-2">Clients</span> <span class="h3 font-bold mb-0">215</span></div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-primary text-white text-lg rounded-circle"><i
                                            class="bi bi-people"></i></div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-success text-success me-2"><i
                                        class="bi bi-arrow-up me-1"></i>23% </span><span
                                    class="text-nowrap text-xs text-muted">Since last week</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span class="h6 font-semibold text-muted text-sm d-block mb-2">Total Units Generated</span>
                                     <span class="h3 font-bold mb-0">1.400 <small>Kw</small></span></div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-info text-white text-lg rounded-circle"><i
                                            class="bi bi-lightning-charge"></i></div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-danger text-danger me-2"><i
                                        class="bi bi-arrow-down me-1"></i>-10% </span><span
                                    class="text-nowrap text-xs text-muted">Since last month</span></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col"><span class="h6 font-semibold text-muted text-sm d-block mb-2">Algorithm Efficiency</span> <span class="h3 font-bold mb-0">95%</span></div>
                                <div class="col-auto">
                                    <div class="icon icon-shape bg-warning text-white text-lg rounded-circle"><i
                                            class="bi bi-code-slash"></i></div>
                                </div>
                            </div>
                            <div class="mt-2 mb-0 text-sm"><span
                                    class="badge badge-pill bg-soft-success text-success me-2"><i
                                        class="bi bi-arrow-up me-1"></i>15% </span><span
                                    class="text-nowrap text-xs text-muted">Since last week</span></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header border-bottom">
                    <h5 class="mb-0">Latest projects</h5>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover table-nowrap">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Due Date</th>
                                <th scope="col">Status</th>
                                <th scope="col">Team</th>
                                <th scope="col">Completion</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img alt="..." src="/assets/img/social/airbnb.svg"
                                        class="avatar avatar-sm rounded-circle me-2"> <a
                                        class="text-heading font-semibold" href="#">Website Redesign</a></td>
                                <td>23-01-2022</td>
                                <td><span class="badge badge-lg badge-dot"><i class="bg-warning"></i>In
                                        progress</span></td>
                                <td>
                                    <div class="avatar-group"><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-1.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-3.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-4.jpg"></a></div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center"><span class="me-2">38%</span>
                                        <div>
                                            <div class="progress" style="width:100px">
                                                <div class="progress-bar bg-warning" role="progressbar"
                                                    aria-valuenow="38" aria-valuemin="0" aria-valuemax="100"
                                                    style="width:38%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-end"><a href="#" class="btn btn-sm btn-neutral">View</a> <button
                                        type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                            class="bi bi-trash"></i></button></td>
                            </tr>
                            <tr>
                                <td><img alt="..." src="/assets/img/social/amazon.svg"
                                        class="avatar avatar-sm rounded-circle me-2"> <a
                                        class="text-heading font-semibold" href="#">E-commerce App</a></td>
                                <td>23-01-2022</td>
                                <td><span class="badge badge-lg badge-dot"><i class="bg-success"></i>Done</span>
                                </td>
                                <td>
                                    <div class="avatar-group"><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-1.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-3.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-4.jpg"></a></div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center"><span class="me-2">83%</span>
                                        <div>
                                            <div class="progress" style="width:100px">
                                                <div class="progress-bar bg-success" role="progressbar"
                                                    aria-valuenow="83" aria-valuemin="0" aria-valuemax="100"
                                                    style="width:83%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-end"><a href="#" class="btn btn-sm btn-neutral">View</a> <button
                                        type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                            class="bi bi-trash"></i></button></td>
                            </tr>
                            <tr>
                                <td><img alt="..." src="/assets/img/social/bootstrap.svg"
                                        class="avatar avatar-sm rounded-circle me-2"> <a
                                        class="text-heading font-semibold" href="#">Learning Platform</a></td>
                                <td>23-01-2022</td>
                                <td><span class="badge badge-lg badge-dot"><i class="bg-danger"></i>Project at
                                        risk</span></td>
                                <td>
                                    <div class="avatar-group"><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-1.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-3.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-4.jpg"></a></div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center"><span class="me-2">4%</span>
                                        <div>
                                            <div class="progress" style="width:100px">
                                                <div class="progress-bar bg-danger" role="progressbar" aria-valuenow="4"
                                                    aria-valuemin="0" aria-valuemax="100" style="width:4%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-end"><a href="#" class="btn btn-sm btn-neutral">View</a> <button
                                        type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                            class="bi bi-trash"></i></button></td>
                            </tr>
                            <tr>
                                <td><img alt="..." src="/assets/img/social/dribbble.svg"
                                        class="avatar avatar-sm rounded-circle me-2"> <a
                                        class="text-heading font-semibold" href="#">Design Portfolio</a></td>
                                <td>23-01-2022</td>
                                <td><span class="badge badge-lg badge-dot"><i class="bg-warning"></i>In
                                        progress</span></td>
                                <td>
                                    <div class="avatar-group"><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-1.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-3.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-4.jpg"></a></div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center"><span class="me-2">10%</span>
                                        <div>
                                            <div class="progress" style="width:100px">
                                                <div class="progress-bar bg-primary" role="progressbar"
                                                    aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"
                                                    style="width:10%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-end"><a href="#" class="btn btn-sm btn-neutral">View</a> <button
                                        type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                            class="bi bi-trash"></i></button></td>
                            </tr>
                            <tr>
                                <td><img alt="..." src="/assets/img/social/spotify.svg"
                                        class="avatar avatar-sm rounded-circle me-2"> <a
                                        class="text-heading font-semibold" href="#">Our team&#39;s playlist</a>
                                </td>
                                <td>23-01-2022</td>
                                <td><span class="badge badge-lg badge-dot"><i class="bg-warning"></i>In
                                        progress</span></td>
                                <td>
                                    <div class="avatar-group"><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-1.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-3.jpg"> </a><a href="#"
                                            class="avatar avatar-xs rounded-circle text-white border border-1 border-solid border-card"><img
                                                alt="..." src="/assets/img/people/img-4.jpg"></a></div>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center"><span class="me-2">83%</span>
                                        <div>
                                            <div class="progress" style="width:100px">
                                                <div class="progress-bar bg-success" role="progressbar"
                                                    aria-valuenow="83" aria-valuemin="0" aria-valuemax="100"
                                                    style="width:83%"></div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-end"><a href="#" class="btn btn-sm btn-neutral">View</a> <button
                                        type="button" class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                            class="bi bi-trash"></i></button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
